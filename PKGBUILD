# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-randfacts
pkgver=0.10.0
pkgrel=1
pkgdesc="Python module used to generate random facts"
arch=('any')
url="https://github.com/TabulateJarl8/randfacts"
license=('MIT')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('3079dd5c2972eefc8f9786f549cc8e145a874a48170afe060c45386a2a8da22755bc9161b2558ea7a77815dc6cbbb8b676c41b7c9de2719dec7d8e6860235ddf')

build() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
