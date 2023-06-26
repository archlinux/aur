# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufomerge
pkgver=1.2.0
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
sha256sums=('3aa49a73afc80dcc95c8810a00b30db93f262a646cdf65dc425e5830c0143c7e')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
