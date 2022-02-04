# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-audio-pan-filter
pkgver=0.1.2
pkgrel=3
pkgdesc="This is a simple plugin to control stereo pan of audio source in OBS Studio"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/audio-pan-filter.1042/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("f4a93cf85ea98f13861181e93b4c4f60dffef8a8a1206b214bd3d6f3fdcade79")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr'
  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
