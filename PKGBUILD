# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: tee < teeaur at duck dot com >

pkgname=tweeny
pkgver=4.1.0
pkgrel=1
pkgdesc="A modern C++ tweening library"
arch=('any')
url="http://mobius3.github.io/tweeny"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mobius3/tweeny/archive/v$pkgver.tar.gz")
sha256sums=('110903c6b5e2a68b28927c0ecf0c504d1b682fcd451f874880448857311a88b4')

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
