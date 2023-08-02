# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-2captcha
_pkgname=2captcha-python
pkgver=1.2.1
pkgrel=1
pkgdesc="Python 3 package for easy integration with the API of 2captcha captcha solving service"
arch=('x86_64')
url="https://github.com/2captcha/2captcha-python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools') 
source=("https://github.com/2captcha/2captcha-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('31b1c6c4e75876be9f869f2ae5c8b10d6ef829b9be8a5cb13cc915cecd18a74a04d2b5bf41335ab441b71c07588bd7e1a344e4bf4b3b94894c9a79776ad55a96')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
