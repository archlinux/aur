# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-randfacts
pkgver=0.24.1
pkgrel=1
pkgdesc="Python module used to generate random facts"
arch=('any')
url="https://github.com/TabulateJarl8/randfacts"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-uv-build' 'python-wheel')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('dafe2b5ef0ff21b3b9603cc92abce16a91712e91884707d3a07a127b27ba142fdd41aabd762328377d1cdae958c904ed417b0d1b02f8afbfc6522aa831e78f3d')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}


package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
