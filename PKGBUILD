# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Tool that provides an alternative to ls when browsing a Linux sysfs'
pkgname=sysls
pkgver=2
pkgrel=1
url=https://git.sr.ht/~martijnbraam/sysls
depends=(glibc python)
makedepends=(python-build python-installer python-setuptools python-wheel)
arch=(any)
license=(GPL-3.0-or-later)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('99f363ea18441c9f49e70601e9d6aa7a92162ac63472982c335c8aa57b30b4e10f072f6bc83b667f6cd63befd3becf423f755e792d88099dfae80a0aa6cb51e6')

build () {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package () {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
