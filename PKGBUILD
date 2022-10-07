# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=librem-control
pkgdesc="Small GTK+/GNOME app to control some system settings of Librem devices, like charge thresholds, LED function etc."
url="https://source.puri.sm/nicole.faerber/librem-control"
pkgver=0.0.1
pkgrel=2
license=(GPL3)
arch=("x86_64")
makedepends=('git')
depends=('gtk4')
source=("${pkgname}-${pkgver}.tar.gz::https://source.puri.sm/nicole.faerber/librem-control/-/archive/pureos/${pkgver}/librem-control-pureos-${pkgver}.tar.gz")
sha1sums=('7eda113f1c70cebe327c6f2acb687c8f9d720537')

build() {
	cd "${srcdir}/${pkgname}-pureos-${pkgver}"
	make all
}

package() {
	cd "${srcdir}/${pkgname}-pureos-${pkgver}"
	PREFIX="${pkgdir}/usr" make install
}
