# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufomerge
pkgver=1.9.2
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
sha256sums=('9316e8dac2233e3591e4eee5c70a91c94b5d3d2e875913ac70ea6185e8998831')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
