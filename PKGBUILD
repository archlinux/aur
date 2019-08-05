# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsd
pkgver=1.0.1
pkgrel=3
pkgdesc="Virtual SD card directory for the Duet software framework"
arch=('any')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetsd')
conflicts=('duetsd')
optdepends=('duetwebcontrol')
source=("https://chrishamm.io/debian/dists/buster/dsf/binary-armhf/duetsd_${pkgver}.deb")
sha256sums=('7ebb6405a0906abceeb32da5db715f8b047424470aa1dcd656588623b275cce3')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/{sys,macros,gcodes,filaments}
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
	ln -s "/opt/dsf/dwc2" "${pkgdir}/opt/dsf/sd/www"
}
