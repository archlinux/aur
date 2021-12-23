# Maintainer: Thomas Weißschuh <aur t-8ch de>

pkgname=profilesalertd
pkgver=0.1.0
pkgrel=1
pkgdesc='Desktop notifications about changes to Linux platform_profile '
url=https://github.com/t-8ch/profilesalertd/
arch=(x86_64)
license=(GPL3)
depends=(systemd)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/t-8ch/profilesalertd/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('9990fad71450d9c2ada725ee1c2cdd65b20613c9ca844b77b0e46aa2f36800e7')

build () {
	cd "${pkgname}-${pkgver}"
	arch-meson build
	ninja -C build
}

package () {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install
}

