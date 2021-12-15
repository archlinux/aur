# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pyname=leather
pkgname=python-$_pyname
pkgver=0.3.4
pkgrel=1
pkgdesc='Python charting for 80% of humans'
arch=(any)
url="https://$_pyname.readthedocs.io"
license=(MIT)
depends=(python
         python-six)
makedepends=(python-setuptools)
checkdepends=(python-cssselect
              python-lxml)
_archive="$_pyname-$pkgver"
source=("$_archive.tar.gz::https://github.com/wireservice/$_pyname/archive/$pkgver.tar.gz")
sha256sums=('8dc9545ccdd998527e283c7990535bfe0628ac71c660737c5c266ee0e461e341')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py test --test-suite=tests
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
