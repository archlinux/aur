# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=poweralertd
pkgver=0.2.0
pkgrel=1
pkgdesc='UPower-powered power alerter '
url=https://git.sr.ht/~kennylevinsen/poweralertd
arch=(x86_64)
license=(GPL)
depends=(mako upower)
makedepends=(scdoc)
source=(
  "${pkgname}-${pkgver}::https://git.sr.ht/~kennylevinsen/poweralertd/archive/$pkgver.tar.gz"
)
sha256sums=('f70076dad452c592e2fcdeba4fd533c11394c254f42c21522aa7b56f92a0bd69')

build () {
	cd "${pkgname}-${pkgver}"
	arch-meson build
	ninja -C build
}

package () {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install
}

