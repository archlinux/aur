# Maintainer: zephyrdrh <zephyrdrh at gmx dot de>
# Contributor: ShadowKyogre <shadowkyogre dot public at gmail dot com>

pkgname=slickpicker-git
pkgver=0.2.r0.g104a9ea
pkgrel=2
pkgdesc="A small PyQt color picker widget (can be run on its own)"
arch=('any')
url="https://github.com/ShadowKyogre/slickpicker/"
license=('GPL-3.0-only')
depends=('python' 'python-pyqt5')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
conflicts=('slickpicker')
provides=('slickpicker')
source=("git+https://github.com/ShadowKyogre/slickpicker/")
md5sums=('SKIP')

pkgver() {
	cd slickpicker
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd slickpicker
    	python -m build --wheel --no-isolation
}

package() {
	cd slickpicker
    	python -m installer --destdir="$pkgdir" dist/*.whl
}
