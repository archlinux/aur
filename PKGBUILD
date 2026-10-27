# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: tee < teeaur at duck dot com >

pkgname=tweeny
pkgver=4.2.0
pkgrel=1
pkgdesc="A modern C++ tweening library"
arch=('any')
url="http://mobius3.github.io/tweeny"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mobius3/tweeny/archive/v$pkgver.tar.gz")
sha256sums=('b3dd2133eb7900d5fa6067b92c2a5e6e4fe853d89d4386af2b3e19ad51b4c82e')

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
