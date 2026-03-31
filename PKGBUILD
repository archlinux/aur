# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-randfacts
pkgver=0.24.4
pkgrel=1
pkgdesc="Python module used to generate random facts"
arch=('any')
url="https://github.com/TabulateJarl8/randfacts"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-uv-build' 'python-wheel')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('5619eaf8ec693bf4435df885999ff866ea2607db012a1c68beac910d49f88e2479b2ca3ae9a2163736a2c6f23dc354720ab6eb5d03471852a24e5b04b4519a06')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}


package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
