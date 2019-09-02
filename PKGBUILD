# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsd-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Virtual SD card directory for the Duet software framework"
arch=('any')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetsd')
conflicts=('duetsd')
optdepends=('duetwebcontrol')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetsd_${pkgver}.deb")
sha256sums=('0f134994cf55f1b8e8cf4efe9e04876b6c6cb1d09fc3546acdeac0ca50a47242')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/{sys,macros,gcodes,filaments}
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
	ln -s "/opt/dsf/dwc2" "${pkgdir}/opt/dsf/sd/www"
}
