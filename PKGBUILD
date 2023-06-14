# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-universal_pathlib
_pkgname=${pkgname#python-}
pkgver=0.0.23
pkgrel=1
pkgdesc='pathlib api extended to use fsspec backends'
arch=(any)
license=(MIT)
url="https://github.com/fsspec/$_pkgname"
depends=(python
         python-fsspec)
makedepends=(python-{build,installer,wheel}
             python-flit-core)
_archive=("$_pkgname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('bd7ed0ad5c6a31b3bf0835b9e7526ed0974ec3a49e4a6a02b1f4058ce63ec79c')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
