# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-2captcha
_pkgname=2captcha-python
pkgver=2.0.6
pkgrel=1
pkgdesc="Python 3 package for easy integration with the API of 2captcha captcha solving service"
arch=('x86_64')
url="https://github.com/2captcha/2captcha-python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools') 
source=("https://github.com/2captcha/2captcha-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('c35ab1f4cbabd0612111c7ee413a63081b88bccad0ab5a510b22b11ed0a19033d5b88905d3d45345a84c6435ff6b28230659bb60675d1445868fd3689d7b937c')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
