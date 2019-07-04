# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

pkgname=python-librouteros
_pkgname=librouteros
pkgver=2.3.0
pkgrel=1
pkgdesc="C library to communicate with network devices by MikroTik running their Linux-based operating system RouterOS."
url="https://github.com/luqasz/librouteros"
arch=("i686" "x86_64" "armv7h")
license=("ISC")
depends=("gcc-libs" "python" "python-setuptools")
source=("https://github.com/luqasz/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("5eaa802a781e021cb7a1e626c75f8c5a744d7c995251b4b408aabbc409daf4a1")
conflicts=("${_pkgname}-git")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
