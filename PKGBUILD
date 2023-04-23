# Maintainer: Christopher <archlinux-maintainer@christopherz.com>

pkgname="dec"
pkgver=r29.0f26721
pkgrel=1
pkgdesc="A declarative package manager for Arch Linux"
arch=("any")
url="https://gitlab.com/rehposuite/dec"
license=("GPL")
depends=("bash" "paru")
makedepends=("git")
provides=("$pkgname")
source=("git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "dec" "${pkgdir}/usr/bin/dec"
}
