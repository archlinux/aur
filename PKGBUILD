# Maintainer: grandchild
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=python-pyclipper
_pkgname=pyclipper
pkgname="python-$_pkgname"
pkgver=1.3.0
pkgrel=2
pkgdesc='Cython wrapper for the C++ translation of the Angus Johnson’s Clipper library'
url="https://github.com/fonttools/$_pkgname"
arch=(x86_64 i686)
license=(MIT)
depends=(python)
makedepends=(python-setuptools-scm cython)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('48a1b5c585aea10e5b9c0b82d6abe2642fafd9ef158b9921852bc4af815ca20c')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
