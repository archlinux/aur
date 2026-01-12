# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-universal_pathlib
_pkgname=${pkgname#python-}
pkgver=0.3.8
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
sha256sums=('ead2b65bca3df6e11c3b7cb36fc9846340bc3c2db4ef57131550260422b0a3e8')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
