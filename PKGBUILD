# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-flatten-dict
_pyname=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc='A flexible utility for flattening and unflattening dict-like objects in Python'
arch=(any)
license=(Apache-2.0)
url="https://github.com/anlini/${_pyname}"
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
# checkdepends=(python-pytest)
_archive="${_pyname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('ca89664d0bc9552d525ee756726b5a755c17f65b5bf23d0a1f07841f181428b7')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
