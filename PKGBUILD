# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

_pkgname=pyfuse3
pkgbase=python-pyfuse3
pkgname=(python-pyfuse3)
pkgver=3.1.1
pkgrel=1
arch=('x86_64')
pkgdesc="Python 3 bindings for libfuse 3 with asynchronous API (Trio compatible)"
url="https://github.com/libfuse/pyfuse3"
license=('LGPL')
depends=('python' 'python-trio' 'fuse3')
makedepends=('python-setuptools')
source=("https://github.com/libfuse/pyfuse3/releases/download/release-$pkgver/$_pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('9feb42a8639dc4815522ee6af6f7221552cfd2df1c7a7e9df96767be65e18667'
            'SKIP')
validpgpkeys=('ED31791B2C5C1613AF388B8AD113FCAC3C4E599F')

build() {
	cd pyfuse3-$pkgver
	python setup.py build
}

package_python-pyfuse3() {
	cd pyfuse3-$pkgver
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
