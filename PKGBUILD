# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=concise-keyring
pkgver=1.0.1
pkgrel=1
pkgdesc='The Concise Keyring'
arch=(any)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=()
makedepends=(git)                 
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "1.0.""$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  rm -rf "${pkgdir}/usr/share/pacman/keyrings/concise*"
  install -Dm644 ${srcdir}/${pkgname}/usr/share/pacman/keyrings/* -t "${pkgdir}/usr/share/pacman/keyrings/"
}
