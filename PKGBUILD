# Maintainer: grandchild
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=python-pyclipper
_pkgname=pyclipper
pkgname="python-$_pkgname"
pkgver=1.3.0
pkgrel=3
pkgdesc='Cython wrapper for the C++ translation of the Angus Johnson’s Clipper library'
url="https://github.com/fonttools/$_pkgname"
arch=(x86_64 i686)
license=(MIT)
depends=(python)
makedepends=(cython
             python-setuptools-scm)
_archive="$_pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.zip")
sha256sums=('48a1b5c585aea10e5b9c0b82d6abe2642fafd9ef158b9921852bc4af815ca20c')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
