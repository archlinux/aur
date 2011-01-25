# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor : vti <viacheslav.t at gmail dot com>

pkgname=vim-align
pkgver=35.41
_scriptid='10110'
pkgrel=5
pkgdesc='Lets you align lines using regular expressions'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=294'
license=('GPL')
depends=('vim')
install=vimdoc.install
source=("$pkgname.vbz.gz::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
  'LICENSE')
md5sums=('423eb712431d4de22a8790fb145b7053'
         'b924ab4f0d09585ac4482208cc32bd2f')

build() {
  install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
  cd "${pkgdir}/usr/share/vim/vimfiles"

  /usr/bin/vim -n -i NONE -c ":UseVimball `pwd`" -c ":q" $srcdir/$pkgname.vbz
  rm -f '.VimballRecord' 'doc/tags'
  install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
