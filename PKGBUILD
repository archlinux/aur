# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-2captcha
_pkgname=2captcha-python
pkgver=1.2.3
pkgrel=1
pkgdesc="Python 3 package for easy integration with the API of 2captcha captcha solving service"
arch=('x86_64')
url="https://github.com/2captcha/2captcha-python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools') 
source=("https://github.com/2captcha/2captcha-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('2b4e75b0b5f58a8ee9d575bc1782c39f06ef4c5b43532e0a47f84eeccfd1d664937362e002818a672a0d6f38a9668609b051b2eb36389a1dd9d4ce7090bca1cf')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
