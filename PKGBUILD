# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-multisource-effect
pkgver=0.1.6
pkgrel=1
pkgdesc="This is a simple source providing custom effect to render multiple sources"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/multi-source-effect.1412/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("8c631a400bfde1e333fb4ad5756cf8e59238f719bff63598847605a03644e8b4")

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
