# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail.com>
pkgname=python-randfacts
pkgver=0.24.2
pkgrel=1
pkgdesc="Python module used to generate random facts"
arch=('any')
url="https://github.com/TabulateJarl8/randfacts"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-uv-build' 'python-wheel')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('5006ea0022dce0e0bf25c86bfa9be5389ea61db300b41554feec725e046e16527ff0710877f0831cbb8b5eb161c79f98bdc301006976689ad3dd74b5908b495f')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}


package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
