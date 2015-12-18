# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=wsjtx-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=(i686 x86_64)
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=("GPL-3")
depends=(qt5-base qt5-multimedia qt5-serialport libusb libusb-compat gcc-fortran libpulse libpng kvasd-bin)
provides=(wsjtx)
conflicts=(wsjtx)
makedepends=()

if [ "$CARCH" == "x86_64" ]; then
  debfile="wsjtx_1.6.0_amd64.deb"
  md5sums=(4d886a91e7ef105f623fa22ef23f228f)
else
  debfile="wsjtx_1.6.0_i386.deb"
  md5sums=(37737d36da5beaacff6c56c722e11335)
fi
  
source=("http://physics.princeton.edu/pulsar/k1jt/${debfile}")

prepare() {
	cd "$srcdir"
	ar vx $debfile
}

package() {
	cd "$srcdir"
	tar -C ${pkgdir}/ -xvf data.tar.gz
	cd "$pkgdir"
	chmod 755 usr/ usr/share/ usr/bin/ usr/share/doc/ 
	chmod 755 usr/share/applications/ usr/share/pixmaps/
}
