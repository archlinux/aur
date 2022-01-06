# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-text-pthread
pkgver=1.0.3
pkgrel=2
pkgdesc="This plugin aims to show beautiful texts on OBS Studio"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-pthread-text.1287/"
license=("GPL2")
depends=("obs-studio" "pango")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("03381a84c1e176d738f7a38bbf0fbb0486af1eb6e4bc81e4e82dc05423fd7ba6")

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
