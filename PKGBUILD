# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsd
pkgver=1.0.1
pkgrel=5
pkgdesc="Virtual SD card directory for the Duet software framework"
arch=('any')
url="https://github.com/chrishamm/DuetSoftwareFramework"
license=('GPL3')
provides=('duetsd')
conflicts=('duetsd')
optdepends=('duetwebcontrol')
source=("https://pkg.duet3d.com/dists/unstable/armv7/binary-armhf/duetsd_${pkgver}.deb")
sha256sums=('cfc713e5ffdb5a4340ab531583c4915d6ee9a230e23fdf2e78ea30ba66e5b00e')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/{sys,macros,gcodes,filaments}
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
	ln -s "/opt/dsf/dwc2" "${pkgdir}/opt/dsf/sd/www"
}
