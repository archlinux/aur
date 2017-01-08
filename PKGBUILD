# Maintainer: SeeLook <seelook@gmail.com>
pkgname=qrab
pkgver=0.3
pkgrel=1
pkgdesc="Simply grabs QR code from screen and copies decoded text into clipboard"
arch=('x86_64' 'i686')
url="http://qrab.sourceforge.net/"
license=('GPL3')
groups=()
depends=('qt5-quickcontrols2' 'zbar' 'qml-material')
optdepends=()
makedepends=('qt5-quickcontrols2' 'zbar' 'qml-material')
source=("https://sourceforge.net/projects/qrab/files/QRab-$pkgver/qrab-$pkgver-source.tar.bz2")
md5sums=('68f67e3efd321bba892c838df5387265')

build() {
  cd "$srcdir/qrab-$pkgver-source"
  mkdir "$srcdir/qrab-$pkgver-source/build"
  cd "$srcdir/qrab-$pkgver-source/build"
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "$srcdir/qrab-$pkgver-source/build"
  make DESTDIR="$pkgdir/" install
} 
