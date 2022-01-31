# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=uharfbuzz
pkgname=python-$_pyname
pkgver=0.20.0
pkgrel=1
pkgdesc='Streamlined Cython bindings for the harfbuzz shaping engine'
arch=(x86_64)
url="https://github.com/harfbuzz/$_project"
license=(Apache)
depends=(python)
makedepends=(cython
             python-setuptools-scm
             python-scikit-build)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('29a0c286c2f89d62b7b40277615111313cc27728d1c8773580b53239d10f93b0')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
