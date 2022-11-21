# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-wsgiproxy2
pkgver=0.5.1
pkgrel=3
pkgdesc="A WSGI Proxy with various http client backends"
arch=('any')
license=('MIT')
url="https://github.com/gawel/WSGIProxy2/"
depends=('python38-webob' 'python38-six')
makedepends=('python38-setuptools')
checkdepends=('python38-nose' 'python38-requests' 'python38-webtest' 'python38-waitress')
source=("https://github.com/gawel/WSGIProxy2/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('f72e151fedafae535fae3708220586b4baf137b66980b4b395be2895ae2c91e4a8c2a0473cb76a80de6ce057cdf9990620184f726235c1bb780bfb59d0cf54c0')

build() {
  cd WSGIProxy2-$pkgver
  python3.8 setup.py build
}

check() {
  cd WSGIProxy2-$pkgver
  nosetests3
}

package() {
  cd WSGIProxy2-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
