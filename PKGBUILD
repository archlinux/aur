# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-universal_pathlib
_pkgname=${pkgname#python-}
pkgver=0.3.7
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
sha256sums=('36331056fa59a7d7cd3b61b4045f3a3418f446f23ec1a01d281c4510814b4b05')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
