# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-doublex
pkgver=1.9.6.1
pkgrel=1
pkgdesc="Powerful test doubles framework for Python"
arch=('any')
license=('GPL')
url="https://github.com/davidvilla/python-doublex"
depends=('python-pyhamcrest' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-nose2')
source=("https://github.com/davidvilla/python-doublex/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c9779c5fcde43af653c2131894da44a878acf2cc81d53f6ab89a6fde071827a22aa97ec5a51561ad8861a98623d38c75f184be6234a6a5323c52e8e538c66710')

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
