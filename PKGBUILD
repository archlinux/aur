# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=sanic-jwt
pkgdesc='Authentication, JWT, and permission scoping for Sanic'
pkgver=1.6.0
pkgrel=2
arch=('x86_64')
license=('MIT')
url='https://github.com/ahopkins/sanic-jwt'
depends=('python-pyjwt' 'twine')
# makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ahopkins/sanic-jwt/archive/v$pkgver.tar.gz")
sha256sums=('a27477dc6681cf5cde4d5ae75d9fd5dccfb556a48823b27fa110cd94230cb212')

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
