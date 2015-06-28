# Maintainer: Tristelune <tristelune@archlinux.info>

pkgname=qtspell
pkgver=0.7.4
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
sha256sums=('eca29599e402c03140528a601205a2ee55d64a24fe26561007095dc612e4c2ab')

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
