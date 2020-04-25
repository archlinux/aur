# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

pkgname=python-librouteros
_pkgname=librouteros
pkgver=3.0.1
pkgrel=1
pkgdesc="C library to communicate with network devices by MikroTik running their Linux-based operating system RouterOS."
url="https://github.com/luqasz/librouteros"
arch=("i686" "x86_64" "armv7h")
license=("ISC")
depends=("gcc-libs" "python" "python-setuptools")
source=("https://github.com/luqasz/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("694bc91a65acb993fa519b2a80fb572399c4f7677afc4868de98d2e2ac3e0cfa")
conflicts=("${_pkgname}-git")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
