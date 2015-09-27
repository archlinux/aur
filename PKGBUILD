# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=dsp-git
_pkgname=dsp
pkgver=204.aad6f78
pkgrel=1
pkgdesc="An audio processing program with an interactive mode"
arch=('any')
url="https://github.com/bmc0/${_pkgname}"
license=('ISC')
depends=('ladspa')
makedepends=('git')

source=(${_pkgname}::"git+https://github.com/bmc0/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr
}

package() {
	make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}

