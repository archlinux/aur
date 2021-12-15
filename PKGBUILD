# Maintainer: grandchild
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=python-pyclipper
_pyname=pyclipper
pkgname="python-$_pyname"
pkgver=1.3.0.post2
pkgrel=1
pkgdesc='Cython wrapper for the C++ translation of the Angus Johnson’s Clipper library'
url="https://github.com/fonttools/$_pyname"
arch=(x86_64 i686)
license=(MIT)
depends=(python)
makedepends=(cython
             python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('c096703dc32f2e4700a1f7054e8b58c29fe86212fa7a2c2adecb0102cb639fb2')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
