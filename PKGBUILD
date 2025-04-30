# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi
pkgver=1.5.2
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
sha256sums=('4ba6882f9ac2aed35050298dd46a83fcceb5af41752ac0ebf7cc08580b5a98f9')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
