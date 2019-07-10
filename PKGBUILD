# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsd
pkgver=1.0.0
pkgrel=2
pkgdesc="Virtual SD card directory for the Duet software framework"
arch=('any')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetsd')
conflicts=('duetsd')
source=('https://chrishamm.io/debian/dists/stretch/dsf/binary-armhf/duetsd_1.0.0.deb')
sha256sums=('3e3f09fbe1e972ded8595e92a237ebdb0e9ab4be16bd78faaae67c7bea918c41')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}/opt/dsf/sd/{sys,macros,gcodes,filaments}"
	ln -s "/opt/dsf/dwc2" "${pkgdir}/opt/dsf/sd/www"
}
