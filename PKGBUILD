# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-randfacts
pkgver=0.24.3
pkgrel=1
pkgdesc="Python module used to generate random facts"
arch=('any')
url="https://github.com/TabulateJarl8/randfacts"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-uv-build' 'python-wheel')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('ffdb5ed41c675b1084ac28835af2e24cd9b53498358164ae4153b802e46f7f5184c103de4692b021e18b3e3bd2ff4c6c9fe0a1d2b1179a07f818ad99a458b9a0')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}


package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
