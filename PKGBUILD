# Maintainer: Milad Alizadeh <milad@mil.ad>
# Based on the `xclip` package in the official repository:
# https://www.archlinux.org/packages/extra/x86_64/xclip/

_pkgname=xclip
pkgname=$_pkgname-git
pkgver=0.13
pkgrel=3
pkgdesc='Command line interface to the X11 clipboard'
url='https://github.com/astrand/xclip'
arch=('x86_64')
license=('GPL')
depends=('libxmu')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/astrand/$_pkgname")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
