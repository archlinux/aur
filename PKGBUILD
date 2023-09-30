# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-pyfuse3
pkgname=(python-pyfuse3)
pkgver=3.3.0
pkgrel=1
arch=('x86_64')
pkgdesc="Python 3 bindings for libfuse 3 with asynchronous API (Trio compatible)"
url="https://github.com/libfuse/pyfuse3"
license=('LGPL')
depends=('python' 'python-trio' 'fuse3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/libfuse/pyfuse3/releases/download/${pkgver}/pyfuse3-${pkgver}.tar.gz"{,.asc})
sha256sums=('2b31fe412479f9620da2067dd739ed23f4cc37364224891938dedf7766e573bd'
            'SKIP')
validpgpkeys=('ED31791B2C5C1613AF388B8AD113FCAC3C4E599F'
              '6D5BEF9ADD2075805747B70F9F88FB52FAF7B393')

build() {
	cd pyfuse3-$pkgver
	python -m build --wheel --no-isolation
}

package_python-pyfuse3() {
	cd pyfuse3-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
