# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pyname=leather
pkgname=python-$_pyname
pkgver=0.3.3
pkgrel=4
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
sha256sums=('70f621f7c5ddac6bc3261850134c0187cb200844243eb878a29f8a8f15a8db46')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
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
