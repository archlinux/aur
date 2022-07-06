# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=librem-control
pkgdesc="Small GTK+/GNOME app to control some system settings of Librem devices, like charge thresholds, LED function etc."
url="https://source.puri.sm/nicole.faerber/librem-control"
pkgver=0.0.1
pkgrel=1
license=(GPL3)
arch=("x86_64")
makedepends=('git')
depends=('gtk4')
source=("${pkgname}-${pkgver}.tar.gz::https://source.puri.sm/nicole.faerber/librem-control/-/archive/v${pkgver}/librem-control-v${pkgver}.tar.gz")
sha1sums=('5f01b7afe2e3aa84e7146cdda043b35cb1ba942c')

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	make all
}

package() {
	install -D ${srcdir}/${pkgname}-v${pkgver}/librem-control ${pkgdir}/usr/bin/librem-control
	install -D ${srcdir}/${pkgname}-v${pkgver}/org.freedesktop.policykit.librem-control.policy ${pkgdir}/usr/share/polkit-1/actions/org.freedesktop.policykit.librem-control.policy
}
