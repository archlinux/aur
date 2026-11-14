# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-flatten-dict
_pyname=${pkgname#python-}
pkgver=0.6.0
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
sha256sums=('e7a9cdf79ff30ccf2ee5c9f583c02d140a802e90496898a2ca46b4ed12006a16')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
