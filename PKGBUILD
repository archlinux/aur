# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=wsjtx-bin
pkgver=1.5.0
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
  debfile="wsjtx_1.5.0_amd64.deb"
  md5sums=(19c56e6a2dd273eaf3d6125933cb6381)
else
  debfile="wsjtx_1.5.0_i386.deb"
  md5sums=(c3e3fe2351cebf1f81133de140d8ff6c)
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
