pkgname=garminplugin
pkgrel=1
pkgver=0.3.27
pkgdesc="Garmin Communicator Plugin for Linux"
arch=('i686' 'x86_64')
url="http://www.andreas-diesner.de/garminplugin/doku.php"
license=('GPL')
depends=("garmintools" "tinyxml" "libusb")
source=(https://github.com/adiesner/GarminPlugin/archive/V${pkgver}.zip)
sha256sums=('5487a1d3242f3d35bbf2830bae5fa5e84cec9245f0da87c90ca2d9a3ca225be0')

build() {
  cd ${srcdir}/GarminPlugin-${pkgver}/src
  ./configure CXXFLAGS="-fPIC -g -O2" CFLAGS="-g -O2 -fPIC"
  make
}

package() {
  mkdir -p "$pkgdir/usr/lib/mozilla/plugins/"
  mv -v "${srcdir}/GarminPlugin-${pkgver}/src/npGarminPlugin.so" "$pkgdir/usr/lib/mozilla/plugins/"

}

