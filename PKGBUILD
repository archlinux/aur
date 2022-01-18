# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=python-pbar
pkgver=2.1.0
pkgrel=1
pkgdesc="A Python library to display customizable progress bars on the terminal easily."
arch=(any)
url="https://github.com/DarviL82/PBar"
license=('MIT')
depends=('python>=3.9')
makedepends=('python-setuptools')
_pypi_name=PBar2
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha256sums=('98addf1cad878e6303fc7c4ad1a9f86ef24550f8128e77b9793dfadf4f037fad')

build() {
	cd "$_pypi_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_pypi_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
