# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=openstep_plist
pkgname=python-${_pyname/_/-}
pkgver=0.3.0
pkgrel=1
pkgdesc='OpenStep plist parser and writer written in Cython'
arch=(x86_64)
url="https://github.com/fonttools/$_pyname"
license=(MIT)
depends=(python)
makedepends=(cython
             python-setuptools-scm)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('28ee2c18a8e8779070505435314d92d5d1b40f2889d3a99dae831b443b2e8019')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
