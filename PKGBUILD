# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-multisource-effect
pkgver=0.1.0
pkgrel=1
pkgdesc="This is a simple source providing custom effect to render multiple sources"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/multi-source-effect.1412/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("703f37a91f8154b70cb419bbc34287598ddc1a748f6a544cd784d5d9de8c7df8")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_INSTALL_PREFIX=/usr

  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir" install
}
