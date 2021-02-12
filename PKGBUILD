# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsoftwareframework-bin
pkgver=3.2.2
pkgrel=1
pkgdesc="Meta package for the full Duet software framework"
arch=('any')
url="https://github.com/Duet3D/DuetSoftwareFramework"
license=('GPL3')
provides=("duetsoftwareframework=${pkgver}")
conflicts=("duetsoftwareframework")
optdepends=(
	"duetruntime-bin>=${pkgver}"
	"duetcontrolserver-bin>=${pkgver}"
	"duetsd-bin>=1.1.0"
	"duettools-bin>=${pkgver}"
	"duetwebcontrol-bin>=${pkgver}"
	"duetwebserver-bin>=${pkgver}"
	"reprapfirmware-bin>=${pkgver}"
)
install="${pkgname}.install"
source=("https://pkg.duet3d.com/dists/unstable/armv7/binary-armhf/duetsoftwareframework_${pkgver//_/-}_armhf.deb")
md5sums=('35d330457fc50c2f75317ca74433828c')
sha1sums=('e2643d735a60a80d4282f7551880dcc2fdfac596')
sha256sums=('78799a1d712622b0026101c967e19681d93c1991a6d432136b705e32e04dc7cc')
sha512sums=('d50ec77e6ccbebab7038f6b73f2d25a04703ba2af1f2f97daa6c0d8a72e1b397d040c2695dda1299b1aa4c9e814871991fdfcca65fd91f8009ffd121cf75e0fc')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -Dm 644 "${srcdir}/usr/lib/sysusers.d/duetsoftwareframework.conf" "${pkgdir}/usr/lib/sysusers.d/duetsoftwareframework.conf"
}
