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
sha256sums=('b8d9ca0de80940157dea4a6531346cf3c43b54b6bcb661a6baac85ac37adf211'
            '49bbc4c6b0169346d675bbbbca8f11cde565b6b15b5a621e4b45b5e358889262')
source=("${pkgname}.vbz.gz::https://www.vim.org/scripts/download_script.php?src_id=${_scriptid}"
  'LICENSE')

package() {
  install -dm755 "${pkgdir}"/usr/share/vim/vimfiles
  cd "${pkgdir}"/usr/share/vim/vimfiles

  /usr/bin/vim -n -i NONE -c ":UseVimball `pwd`" -c ":q" "${srcdir}"/$pkgname.vbz
  rm -f '.VimballRecord' 'doc/tags'
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
