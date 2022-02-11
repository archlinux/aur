# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=sanic-jwt
pkgdesc='Authentication, JWT, and permission scoping for Sanic'
pkgver=1.7.0
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://github.com/ahopkins/sanic-jwt'
depends=('python-pyjwt' 'twine')
# makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ahopkins/sanic-jwt/archive/v$pkgver.tar.gz")
sha256sums=('1bc25f5d24ad20660137e611e9a1e0e8e9a06745058482b6b8f5156ba016e5ed')

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
