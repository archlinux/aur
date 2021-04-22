# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=sanic-cors
pkgdesc='A Sanic extension for handling Cross Origin Resource Sharing (CORS), making cross-origin AJAX possible. Based on flask-cors by Cory Dolphin.'
pkgver=1.0.0
pkgrel=2
arch=('x86_64')
license=('MIT')
url='https://github.com/ashleysommer/sanic-cors'
depends=()
# makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ashleysommer/sanic-cors/archive/$pkgver.tar.gz")
sha256sums=('ca0cb2204f86231b9c205a75a1644088eb1065945c5b84342215d6046bb71012')

build() {
  cd $pkgname-$pkgver
  
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}