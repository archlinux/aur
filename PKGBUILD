# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=python-declare
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="Declare attributes"
url="https://pypi.org/project/declare/#description"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
sha256sums=('4c3c35ed96dcbdf45f4beeeb14554582a04d49d0094a8ec9fd61d10a0f9aa7fb')
