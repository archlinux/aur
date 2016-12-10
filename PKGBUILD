# Maintainer: Tristelune <tristelune@archlinux.info>

pkgname=qtspell
pkgver=0.8.2
pkgrel=3
pkgdesc="Spell checking for Qt text widgets"
arch=('i686' 'x86_64')
url="https://github.com/manisandro/qtspell"
license=('GPL3')
depends=('enchant' 'iso-codes' 'qt5-tools')
makedepends=('cmake' 'qt4')
source=(
  "https://github.com/manisandro/qtspell/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
)
sha256sums=('4f8b902b5da39ce532e532f9ec4916d03d623baf6e46a9b0c4afce76800c40e0')

build() {
  cd "$pkgname-$pkgver"

  mkdir build
  cd build
 
  cmake -DUSE_QT5=true -DCMAKE_INSTALL_PREFIX=/usr ..
  
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/build
  make DESTDIR="$pkgdir"/ install
}
