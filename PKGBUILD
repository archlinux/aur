# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-universal_pathlib
_pkgname=${pkgname#python-}
pkgver=0.0.24
pkgrel=1
pkgdesc='pathlib api extended to use fsspec backends'
arch=(any)
license=(MIT)
url="https://github.com/fsspec/$_pkgname"
depends=(python
         python-fsspec)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive=("$_pkgname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('fcbffb95e4bc69f704af5dde4f9a624b2269f251a38c81ab8bec19dfeaad830f')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
