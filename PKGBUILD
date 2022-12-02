# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-randfacts
pkgver=0.19.0
pkgrel=1
pkgdesc="Python module used to generate random facts"
arch=('any')
url="https://github.com/TabulateJarl8/randfacts"
license=('MIT')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('52932bd9dc3805bfd923c075ad974c19f83cf3b58bc6691356d03c48a72ea390f8a66be86b8677e2315ead578b69c4647f442a985ad9a8831ed5d5d46ed5f014')

build() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
