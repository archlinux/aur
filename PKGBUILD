# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-multisource-effect
pkgver=0.1.7
pkgrel=1
pkgdesc="This is a simple source providing custom effect to render multiple sources"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/multi-source-effect.1412/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("1b4429f0d6a1b92287201227c6d84220a40dc6a2939bab8e0171eba3449703b8")

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
