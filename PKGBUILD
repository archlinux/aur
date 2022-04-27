# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-jxlpy
_reponame=jxlpy
pkgver=0.9.1
pkgrel=1
pkgdesc="Module for reading and writing support for JPEG XL directly from Python"
url="https://pypi.org/project/jxlpy/"
arch=(any)
license=('GPL3')
depends=('python' 'libjxl')
makedepends=('python-setuptools' 'cython' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/olokelo/jxlpy/archive/${pkgver}.tar.gz")
sha256sums=('3ff9425833837905fe12a155c3dddbaf9361f5a7b4cfa79abbef050ca4b0653f')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
