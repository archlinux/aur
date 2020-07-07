# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor : vti <viacheslav.t at gmail dot com>

pkgname=vim-align
pkgver=37.43
_scriptid='19633'
pkgrel=5
pkgdesc='Lets you align lines using regular expressions'
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=294'
license=('custom')
depends=('vim')
groups=('vim-plugins')
md5sums=('40bf32ee1da9ea08b65cb107f5181f0f'
         'b924ab4f0d09585ac4482208cc32bd2f')
source=("$pkgname.vbz.gz::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
  'LICENSE')

package() {
  install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
  cd "${pkgdir}/usr/share/vim/vimfiles"

  /usr/bin/vim -n -i NONE -c ":UseVimball `pwd`" -c ":q" $srcdir/$pkgname.vbz
  rm -f '.VimballRecord' 'doc/tags'
  install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
