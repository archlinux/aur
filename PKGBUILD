# Maintainer: ivanrajkovic
pkgname=lottie-qml
pkgver=1
pkgrel=1
pkgdesc="This provides a QML Item to render Adobe® After Effects™ animations exported as JSON with Bodymovin using the Lottie Web library."
arch=('i686' 'x86_64')
url="https://github.com/kbroulik/lottie-qml"
license=('GPL' 'MIT')
makedepends=('git' 'make' 'cmake')
source=("$pkgname"::'git+https://github.com/kbroulik/lottie-qml.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cmake .
  make
}

package(){
cd "$srcdir/$pkgname"
make DESTDIR="${pkgdir}" install
}
