# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=python-snap7
pkgver=2.0.0
pkgrel=2
pkgdesc="ctypes based python wrapper for snap7"
url="https://github.com/gijzelaerr/python-snap7"
license=("MIT")
arch=("any")
depends=("snap7" "python")
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/gijzelaerr/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0deff2c68cbec9b667940c919940ede24ab57fda3421f17c95e8f0a905512ab2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
