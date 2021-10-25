# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-randfacts
pkgver=0.14.0
pkgrel=1
pkgdesc="Python module used to generate random facts"
arch=('any')
url="https://github.com/TabulateJarl8/randfacts"
license=('MIT')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('556df0fc8b7a8ae61b0bee6fbc4d7489bc763bd1fa8472625d71014fd779c9966358da1593d3f5fa83d7b1aa2f926b8cb048b3cd7f62aac5b207525ad7bd6496')

build() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
