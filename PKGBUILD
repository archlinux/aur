# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Boyan Ding <boyan.j.ding@gmail.com>

_pyname=pygtrie
pkgname=python-$_pyname
pkgver=2.6.1
pkgrel=1
pkgdesc='Python library implementing a trie data structure'
arch=(any)
url="https://github.com/google/$_pyname"
license=(Apache-2.0)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('1934613126070b4ec51a3cefcf0c94cebb0139043b444c0f02486caebd0d8011')

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
