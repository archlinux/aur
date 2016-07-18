# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=lepton
pkgver=1.2.1
pkgrel=1
pkgdesc="Tool and file format for losslessly compressing JPEGs"
arch=('i686' 'x86_64')
url="https://github.com/dropbox/lepton"
license=('APACHE')
makedepends=('cmake' 'zlib' 'openssl')
source=($pkgname-$pkgver::$url/archive/$pkgver.tar.gz)
md5sums=('79fad1d65eb68efed0222b1db4916429')

build() {
  cd $pkgname-$pkgver
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=release -DUSE_SYSTEM_DEPENDENCIES=ON -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
