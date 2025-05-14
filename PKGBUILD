# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=python-librouteros
_pkgname=librouteros
pkgver=3.4.1
pkgrel=1
pkgdesc="C library to communicate with network devices by MikroTik running their Linux-based operating system RouterOS."
url="https://github.com/luqasz/librouteros"
arch=("i686" "x86_64" "armv7h")
license=("GPLv2")
depends=("gcc-libs" "python" "python-setuptools")
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/luqasz/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('efd79f5cf7fa2a8d8017c2a92bb4b512a43a5d1fafc9d757ba232e7a5240e846')
conflicts=("${_pkgname}-git")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m build --wheel
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
