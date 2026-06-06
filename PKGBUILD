# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=python-snap7
pkgver=3.0.0
pkgrel=1
pkgdesc="ctypes based python wrapper for snap7"
url="https://github.com/gijzelaerr/python-snap7"
license=("MIT")
arch=("any")
depends=("snap7" "python")
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/gijzelaerr/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('eeb7dbff9d8597ffaeeac733a905e9d72c2eff9a9407da26372773afe5b4767a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
