# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-multisource-effect
pkgver=0.1.5
pkgrel=1
pkgdesc="This is a simple source providing custom effect to render multiple sources"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/multi-source-effect.1412/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("7a49f2084f9e7dde768cc729cd22f7e57b518318b8fd74dab73d4eb1e336e2e0")

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
