# Maintainer: Tristelune <tristelune@archlinux.info>

pkgname=qtspell
pkgver=0.8.1
pkgrel=1
pkgdesc="Spell checking for Qt text widgets"
arch=('i686' 'x86_64')
url="https://github.com/manisandro/qtspell"
license=('GPL3')
depends=('enchant' 'iso-codes')
makedepends=('cmake' 'qt4')
source=(
  "https://github.com/manisandro/qtspell/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
)
sha256sums=('5d316d654ce9177d3fc92c90cff3297098e9a433711867dacd57382cdccfbd83')

build() {
  cd "$pkgname-$pkgver"

  mkdir build
  cd build
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/build
  make DESTDIR="$pkgdir"/ install
}
