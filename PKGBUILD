# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=uharfbuzz
pkgname=python-$_pyname
pkgver=0.17.0
pkgrel=1
pkgdesc='Streamlined Cython bindings for the harfbuzz shaping engine'
arch=(x86_64)
url="https://github.com/harfbuzz/$_project"
license=(Apache)
depends=(python)
makedepends=(cython
             python-setuptools-scm
             python-scikit-build)
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.zip")
sha256sums=('6e362a6918cfc5225bfa22d10c98c0455618ce4d30ac30fc00e68a851b9f05a0')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pyname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
