# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=python-pbar
pkgver=2.0.3
pkgrel=1
pkgdesc="A Python library to display customizable progress bars on the terminal easily."
arch=(any)
url="https://github.com/DarviL82/PBar"
license=('MIT')
depends=('python>=3.9')
makedepends=('python-setuptools')
_pypi_name=PBar2
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha256sums=('269869bfed4e4dc7dee78bf1e002b65e50c6fc3e7bc9dfbd8708d65c6619f59a')

build() {
	cd "$_pypi_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_pypi_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
