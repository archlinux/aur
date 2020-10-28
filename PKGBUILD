# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=poweralertd
pkgver=0.1.0
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
sha256sums=('aa18af4df577f071722c0879f09690e4bcd8fc191cc187d8d6decf73f3a36085')

build () {
	cd "${pkgname}-${pkgver}"
	arch-meson build
	ninja -C build
}

package () {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install
}

