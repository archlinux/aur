# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-flatten-dict
_pyname=${pkgname#python-}
pkgver=0.4.2
pkgrel=4
pkgdesc='A flexible utility for flattening and unflattening dict-like objects in Python'
arch=(any)
license=(Apache-2.0)
url="https://github.com/anlini/${_pyname}"
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
# checkdepends=(python-pytest)
_archive=("$_pyname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('506a96b6e6f805b81ae46a0f9f31290beb5fa79ded9d80dbe1b7fa236ab43076')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
