# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Loewetiger <loewetiger@protonmail.com>

pkgname=obs-pipewire-audio-capture
pkgver=1.1.0
pkgrel=1
pkgdesc='PipeWire audio capturing for OBS Studio'
arch=('x86_64')
url='https://github.com/dimtpap/obs-pipewire-audio-capture'
license=('GPL2')
depends=('pipewire' 'obs-studio>=28')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=('9ba8f2c70c53ac181d93a8b0544bc41dce2262c91bde309370be878af4215e290ff08159ad25c6cec6b4fbb1b391ac9bdc8daa1cca720fcc6cf2edd70e69163a')

build() {
  cd $pkgname-$pkgver
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cd build
  make
}

package() {
  cd $pkgname-$pkgver/build
  make install
}
