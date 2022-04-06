# Contributor: Fabio Loli <fabio.loli@disroot.org>
# Contributor: Vasket <vasket@dismail.de>
# Contributor: Florian Latifi <mail@florian-latifi.at>

pkgname=evolution-decsync
pkgver=2.0.1
_pkgver=2.0.1-evolution-3.44
pkgrel=2
pkgdesc="An Evolution plugin which synchronizes contacts and calendars using DecSync."
arch=(x86_64 i686 armv7h aarch64)
license=(LGPL)
url="https://github.com/39aldo39/Evolution-DecSync"
depends=(json-c evolution-data-server evolution libdecsync)
makedepends=(meson ninja)
source=("https://github.com/39aldo39/Evolution-DecSync/archive/v${_pkgver}.tar.gz")
sha256sums=('60d36a0522556e519be7390295ce4bd8781fa1f034b2a2dc3cd5207c439f536e')

build() {
  cd "Evolution-DecSync-${_pkgver}"
  meson build
  ninja -C build
}

package() {
  cd "Evolution-DecSync-${_pkgver}"
  DESTDIR="${pkgdir}" meson install -C build
}

