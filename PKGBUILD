# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi
pkgver=1.5.0
pkgrel=1
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux"
arch=(x86_64)
url="https://haguichi.net"
license=(GPL-3.0-or-later)
depends=(
  gtk4
  libadwaita
  libgee
  libportal
  libportal-gtk4
  logmein-hamachi
)
makedepends=(
  meson
  vala
)
source=("http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('94242789f6d65c2878d5c6a515c18581e9a7fda05d47e5701b8ee12bce0f8b54')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
