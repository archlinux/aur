# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Tool that provides an alternative to ls when browsing a Linux sysfs'
pkgname=sysls
pkgver=1
pkgrel=1
url=https://git.sr.ht/~martijnbraam/sysls
depends=(python-setuptools)
arch=(any)
license=(GPL3)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('13380201a8527037d6b2779e1fdd594fd0fe84cb1bfbd66e40b452e0ee01537af0d5634c1033b37450d2d4427ed06a306751ce41dc3d0120a94ef87b44936e04')

build () {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package () {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
