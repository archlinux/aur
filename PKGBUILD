# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ksnip
pkgver=1.8.2
pkgrel=2
pkgdesc='Screenshot tool inspired by Windows Snipping Tool and made with Qt for Linux'
arch=('i686' 'x86_64')
url='https://github.com/DamirPorobic/ksnip'
license=('GPL')
depends=(
  hicolor-icon-theme
  qt5-x11extras
  'kimageannotator>=0.4.2'
)
makedepends=(
  cmake
  extra-cmake-modules
  qt5-tools
  'kimageannotator>=0.4.1'
)
conflicts=(ksnip-git)
source=($pkgname-$pkgver.tar.gz::https://github.com/DamirPorobic/ksnip/archive/v${pkgver}.tar.gz)
sha256sums=('3939ae0fb04494b11c6c6cb7a4b53cd837d282eb96beafdc1acede81abbf9e36')

prepare(){
  cd "$srcdir/$pkgname-$pkgver"
  test -d build || mkdir build
}
build(){
  cd "$srcdir/$pkgname-$pkgver/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}
package(){
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
