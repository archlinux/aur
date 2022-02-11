# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=sanic-cors
pkgdesc='A Sanic extension for handling Cross Origin Resource Sharing (CORS), making cross-origin AJAX possible. Based on flask-cors by Cory Dolphin.'
pkgver=2.0.1
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://github.com/ashleysommer/sanic-cors'
depends=()
# makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ashleysommer/sanic-cors/archive/$pkgver.tar.gz")
sha256sums=('9ba708dffe818812513f22658960e5ec2d2778a1431d6335e02354eba7c119b8')

build() {
  cd $pkgname-$pkgver
  
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
