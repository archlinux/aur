# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-doublex
pkgver=1.9.6
pkgrel=2
pkgdesc="Powerful test doubles framework for Python"
arch=('any')
license=('GPL')
url="https://github.com/davidvilla/python-doublex"
depends=('python-pyhamcrest' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-nose2')
source=("https://github.com/davidvilla/python-doublex/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('322d626fe37ec607f490121656940d20628831051e40b367411d6e0152767b9d3a1db02f9bbf29359dc0801d4eff410ef53d634a111aed55230d3bdedbc42cb2')

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
