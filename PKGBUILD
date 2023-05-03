# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Boyan Ding <boyan.j.ding@gmail.com>

_pyname=pygtrie
pkgname=python-$_pyname
pkgver=2.5.0
pkgrel=2
pkgdesc='Python library implementing a trie data structure'
arch=(any)
url="https://github.com/google/$_pyname"
license=(Apache)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('203514ad826eb403dab1d2e2ddd034e0d1534bbe4dbe0213bb0593f66beba4e2')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	python -m unittest discover
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
