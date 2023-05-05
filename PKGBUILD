# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufomerge
pkgver=1.0.0
pkgrel=1
pkgdesc='A CLI utility and Python library to merge UFO source fonts'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache)
_py_deps=(fonttools
          ufolib2)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('5659936fe63d172ec1f49a9dca1e9d88ff215ab0c28be4549dc18509cc2c60e5')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
