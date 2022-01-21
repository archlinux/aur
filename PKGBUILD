# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

pkgname=python-librouteros
_pkgname=librouteros
pkgver=3.2.0
pkgrel=1
pkgdesc="C library to communicate with network devices by MikroTik running their Linux-based operating system RouterOS."
url="https://github.com/luqasz/librouteros"
arch=("i686" "x86_64" "armv7h")
license=("ISC")
depends=("gcc-libs" "python" "python-setuptools")
source=("https://github.com/luqasz/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('44c1b782efc9185fcfa09270f0b322256642849f644399e5f47fe49dfd385d57')
conflicts=("${_pkgname}-git")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
