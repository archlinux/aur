# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-doublex
pkgver=1.9.4
pkgrel=1
pkgdesc="Powerful test doubles framework for Python"
arch=('any')
license=('GPL')
url="https://github.com/davidvilla/python-doublex"
depends=('python-pyhamcrest' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-nose2')
source=("https://github.com/davidvilla/python-doublex/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0cec6ad2fc7fca9e7bd2833f0466e82483c87f72a41b833fd675005bc574c1b2c1b975501a182b0b17604717a757694ffb3757eda340a8346ef93009e23c3f5b')

build() {
  cd python-doublex-$pkgver
  python setup.py build
}

check() {
  cd python-doublex-$pkgver
  nose2
}

package() {
  cd python-doublex-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir"/usr/README.rst
}
