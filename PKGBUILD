# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-randfacts
pkgver=0.9.0
pkgrel=1
pkgdesc="Python module used to generate random facts"
arch=('any')
url="https://github.com/TabulateJarl8/randfacts"
license=('MIT')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('f77cb4feb0b42ccb6de3fc7d3e1b20d7ff5375936e0ce7811909d72cdd07b808fe6282d01d851f8687f671a3d90d739bd201970a56ac788dfd8f5c8ecca84382')

build() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
