# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Vasket <vasket at  dismail dot de>

pkgname=evolution-decsync
pkgver=1.3.0
pkgrel=2
pkgdesc="DecSync Plugin for Evolution. It syncs contact and calendars to a directory, which can be shared with syncthing or rsync"
arch=(x86_64 i686 armv7h aarch64)
license=(LGPL)
url="https://github.com/39aldo39/Evolution-DecSync"
depends=(json-c evolution-data-server evolution libdecsync)
makedepends=(meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/39aldo39/Evolution-DecSync/archive/v${pkgver}.tar.gz")
sha256sums=('98defcfd8af9b7a3248e7f2b674975b83e66abee08e949a598815189ea83a4dc')

build() {
  cd "Evolution-DecSync-${pkgver}"
  meson build
  ninja -C build
}

package() {
  cd "Evolution-DecSync-${pkgver}"
  DESTDIR="${pkgdir}" meson install -C build
}

