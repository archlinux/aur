# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-rime
pkgver=0.2.2
pkgrel=1
pkgdesc='Fcitx Wrapper for librime'
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.8.1' "librime" "brise")
makedepends=('cmake')
install=fcitx-rime.install
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")

build() {
  cd "$pkgname-$pkgver"

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}

sha512sums=('4497cfdf38e6fd85e358b0c8b52efa21b54a8c46cf5f6a640ca1c1f91a30df2a2033f46eec2d123bfadf9c8c58e4b8f6ec96b1564d32b2b8157261ca14a2855b')
