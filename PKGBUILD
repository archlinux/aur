# Maintainer: Maurice Zhou <ja at apvc punkt uk>
pkgname=rozb3-pac-git
pkgver=git
pkgrel=1
pkgdesc="pacman hook for bieaz"
arch=(any)
url="https://gitlab.com/m_zhou/rozb3-pac"
license=('GPL')
depends=('bieaz-git')
source=("rozb3-pac-git::git+https://gitlab.com/m_zhou/rozb3-pac")
sha256sums=('SKIP')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "${pkgname}"
        make DESTDIR="$pkgdir" install
}

