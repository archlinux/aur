# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-usfm2osis
_pypiname="${pkgname#python-}"
pkgver=0.6.1
pkgrel=3
pkgdesc='Tools for converting Bibles from USFM to OSIS XML'
arch=(any)
url="https://github.com/chrislit/$_pypiname"
license=(GPLv3)
depends=(python)
makedepends=(python-setuptools)
options=(!emptydirs)
_archive="$_pypiname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/$_pypiname/$_archive.tar.gz")
sha256sums=('bdd1d9d14e0b70d617aa88b4753d49d81c091e810a647df166e129a28b0b5deb')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
