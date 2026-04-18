# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi
pkgver=1.5.4
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
sha256sums=('f5eeff31070ac2c20bdd9c79c8a9903a936e9a9f518843086c0da8aa807ff74e')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
