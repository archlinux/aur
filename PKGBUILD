# Maintainer: Ethan Brittain-Morby <ebm539 at protonmail dot com>
pkgname=dsvpn-git
pkgver=r126.e7e1311
pkgrel=3
pkgdesc="A Dead Simple VPN."
arch=('any')
url="https://github.com/jedisct1/dsvpn"
license=('MIT')
depends=()
makedepends=(make gcc git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+https://github.com/jedisct1/dsvpn")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  install -dm 755 "${pkgdir}"/usr/bin/
  install -m 755 dsvpn "${pkgdir}"/usr/bin/dsvpn
}

