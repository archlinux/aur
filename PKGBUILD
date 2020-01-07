# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsd-bin
pkgver=1.0.5
pkgrel=2
pkgdesc="Virtual SD card directory for the Duet software framework"
arch=('any')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetsd=${pkgver}")
conflicts=("duetsd" "reprapfirmware<=1.1.0.0")
depends=('duetcontrolserver')
optdepends=('duetwebcontrol')
backup=('opt/dsf/sd/sys/config.g')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetsd_${pkgver}_all.deb")
md5sums=('7596a862ea428e7f50e79a31257b48e8')
sha1sums=('96d6984a2ec0dc6db356a7f4633c63593c79bc63')
sha256sums=('cc12a0198198af8a6b14aee2f90bbd1c8d356ba107e02e2372a778c9d466df8e')
sha512sums=('8328da81da58dbb3a8d66613aeae0269c5d9f53f99cbefc3c7335c7fd30e2d2c2256297d02c66ce6c27a63bab9d635c2ea34f6a017b6889d168482b095ba9a43')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}"/opt/dsf/sd/{sys,macros,gcodes,filaments}
	install -m 644 "${srcdir}"/opt/dsf/sd/sys/* "${pkgdir}"/opt/dsf/sd/sys/
	ln -s "/opt/dsf/dwc2" "${pkgdir}/opt/dsf/sd/www"
}
