# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=python-pbar
pkgver=2.2.2
pkgrel=1
pkgdesc="A Python library to display customizable progress bars on the terminal easily."
arch=(any)
url="https://github.com/DarviL82/PBar"
license=('MIT')
depends=('python>=3.9')
makedepends=('python-setuptools')
_pypi_name=PBar2
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha256sums=('dc49a707dbdc82a5f16c27b623405440cfd01215f610a82c69b77eb7e4bc53aa')

build() {
	cd "$_pypi_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_pypi_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
