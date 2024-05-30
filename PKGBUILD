# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=sanic-cors
pkgdesc='A Sanic extension for handling Cross Origin Resource Sharing (CORS), making cross-origin AJAX possible. Based on flask-cors by Cory Dolphin.'
pkgver=2.2.0
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://github.com/ashleysommer/sanic-cors'
depends=()
# makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ashleysommer/sanic-cors/archive/$pkgver.tar.gz")
sha256sums=('a370cd9d2102824422122e0f6aa013ad354229d021be5e07ff525a311df1b57c')

build() {
  cd $pkgname-$pkgver
  
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
