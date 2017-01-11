# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=wsjtx-bin
pkgver=1.7.0
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
  debfile="wsjtx_1.7.0_amd64.deb"
  md5sums=(2b8869226d3acb9036a34078f643073a)
else
  debfile="wsjtx_1.7.0_i386.deb"
  md5sums=(4efbb9dc4735560f3f8814a67be4595c)
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
