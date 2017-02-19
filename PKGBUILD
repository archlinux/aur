#Contributor: marauder <abhinav.kssk@gmail.com>
pkgname=ignition-tools
pkgver=0.0.0
pkgrel=1
pkgdesc="Ignition entry point for using all the suite of ignition tools."
arch=('i686' 'x86_64')
url="http://ignitionrobotics.org/"
license=('Apache')
groups=('development')
depends=()
makedepends=('cmake' 'ruby-ronn' 'ruby')
optdepends=()
provides=('ignition-tools')
conflicts=()
replaces=('ignition-tools')
source=("https://bitbucket.org/ignitionrobotics/ign-tools/get/tip.tar.bz2")
sha256sums=('SKIP')

_dir="ignitionrobotics-ign-tools-75a248c4c899"

build() {
 cd "$srcdir/$_dir"
 mkdir -p build
 cd build
   # Configure build
 cmake .. -DCMAKE_BUILD_TYPE="Release" \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_INSTALL_LIBDIR="lib" \
          -DENABLE_TESTS_COMPILATION:BOOL=False
          
            # Compile
 make
}

package() {
 cd "$srcdir/$_dir/build"
 make DESTDIR="$pkgdir/" install
}
