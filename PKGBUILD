# Maintainer: FFY00 <filipe.lains@gmail.com>

pkgname=soapyuhd
pkgver=0.3.4
_gver=soapy-uhd-$pkgver
pkgrel=1
pkgdesc="Soapy SDR plugin for UHD supported SDR devices"
arch=(any)
url="https://github.com/pothosware/SoapyUHD"
license=('GPL3')
depends=('boost' 'libuhd' 'soapysdr')
makedepends=('cmake')
provides=('soapyuhd')
conflicts=('soapyuhd')
source=("https://github.com/pothosware/SoapyUHD/archive/$_gver.tar.gz")
sha256sums=('7b7f2bc9a565f42b6e9b0831db942a5231fd048c79976fb2d1f1710efef83dd0')

build() {
  mkdir -p $srcdir/SoapyUHD-$_gver/build
  cd $srcdir/SoapyUHD-$_gver/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd $srcdir/SoapyUHD-$_gver/build

  make DESTDIR=$pkgdir install
}
