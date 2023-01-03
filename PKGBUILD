# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-2captcha
_pkgname=2captcha-python
pkgver=1.1.3
pkgrel=1
pkgdesc="Python 3 package for easy integration with the API of 2captcha captcha solving service"
arch=('x86_64')
url="https://github.com/2captcha/2captcha-python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools') 
source=("https://github.com/2captcha/2captcha-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('0a83cf80a77f249b29b83815beb1f5603f8917b5362b7ac288690b5034f586013fa2fd9eb750ed547f7bbf4732ac11e8b8178263683c9015877927ff10e35097')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
