# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=python-librouteros
_pkgname=librouteros
pkgver=3.2.1
pkgrel=1
pkgdesc="C library to communicate with network devices by MikroTik running their Linux-based operating system RouterOS."
url="https://github.com/luqasz/librouteros"
arch=("i686" "x86_64" "armv7h")
license=("ISC")
depends=("gcc-libs" "python" "python-setuptools")
source=("https://github.com/luqasz/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('aec31ae8b7c88f5c248a18a5624b74d72c3e1f65e0cbaab0cee9151a9de5d393')
conflicts=("${_pkgname}-git")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
