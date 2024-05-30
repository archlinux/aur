# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=sanic-jwt
pkgdesc='Authentication, JWT, and permission scoping for Sanic'
pkgver=1.8.0
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://github.com/ahopkins/sanic-jwt'
depends=('python-pyjwt' 'twine')
# makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ahopkins/sanic-jwt/archive/v$pkgver.tar.gz")
sha256sums=('0cfae0013014a073f25dc03381dd3bed71e212c29126ed1a3ec12a4cb9c3d2b3')

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
