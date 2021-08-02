# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=pydyf
pkgname=python-$_pyname
pkgver=0.0.3
pkgrel=1
pkgdesc='a low-level PDF generator written in Python and based on PDF specification 1.7'
arch=(any)
url="https://github.com/CourtBouillon/$_pyname"
license=(BSD)
depends=(python
         python-sphinx_rtd_theme)
makedepends=(python-setuptools
             python-sphinx)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('d12ad2ddce4c49c32a7fa06c4b9cf4166d6f4659b6314961a4dedb0857c2d246')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
