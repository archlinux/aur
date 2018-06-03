# Maintainer: Paul Stoetzer <n8hm@arrl.net>
pkgname=wsjtx-bin-rpm
pkgver=1.9.1
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and 
JT65)"
arch=('x86_64')
url="https://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=('GPL-3')
depends=(qt5-base qt5-multimedia qt5-serialport libusb libusb-compat 
gcc-fortran libpulse libpng fftw)
provides=(wsjtx)
conflicts=(wsktx)
makedepends=('rpmextract')
options=('emptydirs')
source=("http://physics.princeton.edu/pulsar/k1jt/wsjtx-1.9.1.x86_64.rpm")
md5sums=(SKIP)

build() {
  rpmextract.sh ./wsjtx-1.9.1.x86_64.rpm
}

package() {
   rm wsjtx-1.9.1.x86_64.rpm
   cp -r ${srcdir}/* ${pkgdir}/
}
