# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-process
pkgver=0.10.0
pkgrel=2
pkgdesc='Modeling and simulation framework for biotechnology processes – python frontend'
arch=(any)
url='https://cadet-process.readthedocs.io/en/latest/'
license=(GPL-3.0-only)
depends=(python)
makedepends=(git python-build python-installer python-wheel)
source=("git+https://github.com/fau-advanced-separations/$pkgname#tag=v$pkgver")
sha256sums=('bb09917c34168e86dc3fb5ffe46ca4ac9df8b3c3c21a20c6c76e2906775eca1b')

build() {
	cd $pkgname
	python -m build --wheel --no-isolation
}

package() {
	depends+=(cadet-core python-numpy python-psutil python-pytest)
	cd $pkgname
	python -m installer --destdir="$pkgdir" dist/*.whl
}
