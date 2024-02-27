# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufomerge
pkgver=1.6.2
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
sha256sums=('4736f9f5abffe3fa4ba9bfe133c7229e47d786952954fbb380e9f56da6184ecd')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
