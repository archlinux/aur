# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufomerge
pkgver=1.8.3
pkgrel=1
pkgdesc='A CLI utility and Python library to merge UFO source fonts'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache-2.0)
_pydeps=(fonttools
         ufolib2)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('9243641ad51ad6c0ada23dbf6c2c702c5f61c392fa719b07e17e6d937c59e0f7')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
