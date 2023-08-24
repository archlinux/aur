# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Loewetiger <loewetiger@protonmail.com>

pkgname=obs-pipewire-audio-capture
pkgver=1.1.1
pkgrel=1
pkgdesc='PipeWire audio capturing for OBS Studio'
arch=('x86_64')
url='https://github.com/dimtpap/obs-pipewire-audio-capture'
license=('GPL2')
depends=('pipewire' 'obs-studio>=28')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=('393a706d0a49550d6d1e03fda72586bb8dae55d06970182c67e3e137e8570c8f69f3d3c4fded37c1f6dbe907e30b3aa806676d4e4195bef71ae528db14520931')

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
