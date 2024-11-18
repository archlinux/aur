# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-randfacts
pkgver=0.22.0
pkgrel=1
pkgdesc="Python module used to generate random facts"
arch=('any')
url="https://github.com/TabulateJarl8/randfacts"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('ce76ab118dd4d8c670177d934deaa2935e18096ab09dff0da8fb4832e6cdd42c7237cd6279c79f2335cda90b7258a8bc2b2237ac9202ba8597c0f6a7f42cb219')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
