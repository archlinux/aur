# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-randfacts
pkgver=0.7.1
pkgrel=1
pkgdesc="Python module used to generate random facts"
arch=('any')
url="https://github.com/TabulateJarl8/randfacts"
license=('MIT')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('b56f65a7f725cf2e9ef6447febf2fcd5aace0d11beb798149186d86738dc9f98a19c909355daa248dbbecfe8c628d940af47dc8430a5c93e13d6e046830e96b0')

build() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
