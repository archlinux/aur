# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-indexed-search-git
pkgver=r40.1bae237
pkgrel=2
pkgdesc='A Vim plugin to show the number of matches and index when searching'
arch=('any')
url='https://github.com/henrik/vim-indexed-search'
license=('unknown')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=('vim-indexed-search')
conflicts=('vim-indexed-search')
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
