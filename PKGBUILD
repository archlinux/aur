# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsd
pkgver=1.0.1
pkgrel=1
pkgdesc="Virtual SD card directory for the Duet software framework"
arch=('any')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetsd')
conflicts=('duetsd')
optdepends=('duetwebcontrol')
source=("https://chrishamm.io/debian/dists/stretch/dsf/binary-armhf/duetsd_${pkgver}.deb")
sha256sums=('a172aa1c533fa7e39658461d27b98e947dcaffde1d3897cfa3e8934a737ccac9')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/{sys,macros,gcodes,filaments}
	ln -s "/opt/dsf/dwc2" "${pkgdir}/opt/dsf/sd/www"
}
