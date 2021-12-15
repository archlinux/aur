# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Boyan Ding <boyan.j.ding@gmail.com>

_pyname=pygtrie
pkgname=python-$_pyname
pkgver=2.4.2
pkgrel=1
pkgdesc='Python library implementing a trie data structure'
arch=(any)
url="https://github.com/google/$_pyname"
license=(Apache)
depends=(python)
makedepends=(python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('43205559d28863358dbbf25045029f58e2ab357317a59b11f11ade278ac64692')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	python test.py
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
