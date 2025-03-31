# Maintainer: Stephen Molloy <sdmolloy@gmail.com>
# Maintainer: Kirill A Pshenichnyi <pshcyrill@mail.ru>
# Contributors: The Tango team (info@tango-controls.org)

pkgname=tango
pkgver=9.5.0
pkgrel=1
pkgdesc="Tango Controls a toolkit for controlling any kind of hardware or software and building SCADA systems"
arch=('i686' 'x86_64')
url="http://www.tango-controls.org/"
license=('GPL3')
depends=('jre8-openjdk' 'mysql' 'doxygen' 'zeromq' 'omniorb' 'binutils' 'tango-idl' 'cppzmq')
conflicts=()
source=("cppTango-$pkgver.tar.gz::https://gitlab.com/tango-controls/cppTango/-/archive/9.5.0/cppTango-$pkgver.tar.gz")
md5sums=('5448a2a09c817a841a1c8435f0af8288')


build() {
	cd "cppTango-$pkgver"
    mkdir -p build
    cd build
    cmake ..
	make
}

package() {
	cd "cppTango-$pkgver"
    cd build
	make DESTDIR="$pkgdir/" install
}
