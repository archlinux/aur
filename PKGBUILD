# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-rime
pkgver=0.2.0
pkgrel=1
pkgdesc='Fcitx Wrapper for librime'
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.7' "librime" "brise")
makedepends=('cmake')
install=fcitx-rime.install
source=(
  "http://fcitx.googlecode.com/files/$pkgname-$pkgver.tar.xz"
)

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

md5sums=('34e9bd76f96d93dd99a6af2ed25d8e26')
