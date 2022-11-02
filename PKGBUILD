# Contributor: Fabio Loli <fabio.loli@disroot.org>
# Contributor: Vasket <vasket@dismail.de>
# Contributor: Florian Latifi <mail@florian-latifi.at>

pkgname=evolution-decsync
pkgver=2.1.0
_pkgver=2.1.0-3-evolution-3.44
pkgrel=2
pkgdesc="An Evolution plugin which synchronizes contacts and calendars using DecSync."
arch=(x86_64 i686 armv7h aarch64)
license=(LGPL)
url="https://github.com/39aldo39/Evolution-DecSync"
depends=(json-glib evolution-data-server evolution libdecsync)
makedepends=(meson ninja)
source=("https://github.com/39aldo39/Evolution-DecSync/archive/v${_pkgver}.tar.gz")
sha256sums=('dc059e3fda4de5ab483bfea536929652165daea8dadfd7843c650281f8d414d4')

build() {
  cd "Evolution-DecSync-${_pkgver}"
  meson build
  ninja -C build
}

package() {
  cd "Evolution-DecSync-${_pkgver}"
  DESTDIR="${pkgdir}" meson install -C build
}

