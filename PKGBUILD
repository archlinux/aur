
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=gfmetadata
pkgname=python-$_pyname
epoch=1
pkgver=0.2.5
pkgrel=1
pkgdesc='Helpers for reading Google Font metadata and protobuf definitions'
arch=(any)
url="https://github.com/googlefonts/gf-metadata"
license=(Apache-2.0)
depends=(python
         python-protobuf)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('c025b801c96277f221c7ddeba3f3525e34e28dee69838562de08e60c0613fd14')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
