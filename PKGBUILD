# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-indexed-search-git
pkgver=r37.1d93f47
pkgrel=1
pkgdesc='A Vim plugin to show the number of matches and index when searching'
arch=('any')
url='https://github.com/henrik/vim-indexed-search'
license=('unknown')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=('vim-indexed-search')
conflicts=('vim-indexed-search')
install=vimdoc.install
source=('git+https://github.com/henrik/vim-indexed-search.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r ${pkgname%-git}/{autoload,doc,plugin} "${_installpath}"
}
