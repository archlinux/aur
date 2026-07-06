# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: tee < teeaur at duck dot com >

pkgname=tweeny
pkgver=3.2.1
pkgrel=1
pkgdesc="A modern C++ tweening library"
arch=('any')
url="http://mobius3.github.io/tweeny"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mobius3/tweeny/archive/v$pkgver.tar.gz")
sha256sums=('76be17b39b234b4a7c12a5d9497ebb3d52b817eaf4c3748d1d21cf7df76835ed')

build() {
  cmake -Bbuild "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTWEENY_BUILD_DOCUMENTATION=OFF
  cmake --build build
}

package() {
  cmake --install build --prefix="$pkgdir"/usr
  install -Dvm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
