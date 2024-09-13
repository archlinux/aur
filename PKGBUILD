# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-universal_pathlib
_pkgname=${pkgname#python-}
pkgver=0.2.5
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
sha256sums=('ea5d4fb8178c2ab469cf4fa46d0ceb16ccb378da46dbbc28a8b9c1eebdccc655')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
