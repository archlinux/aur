# Maintainer: Amin Vakil <info at aminvakil dot com>

_pkgname=vim-markdown
pkgname=vim-markdown-git
pkgver=r504.8e5d86f
pkgrel=3
pkgdesc="Markdown Vim Mode"
arch=('any')
url="https://github.com/preservim/vim-markdown"
license=('MIT')
depends=('vim-plugin-runtime' 'vim-tabular')
makedepends=('git')
conflicts=('vim-markdown')
provides=('vim-markdown')
groups=('vim-plugins')
source=("git+https://github.com/preservim/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  _installpath="$pkgdir/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp -r -t "${_installpath}" after doc ftdetect ftplugin indent registry syntax test
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
