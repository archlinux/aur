# Maintainer: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>
pkgname=kplot
pkgver=0.1.14
pkgrel=1
pkgdesc="Cairo plotting library"
arch=('i686' 'x86_64')
license=('ISC')
depends=('cairo libbsd')
url="https://kristaps.bsd.lv/kplot/"

_pkgname="${pkgname}-${pkgver}"
source=("https://kristaps.bsd.lv/kplot/snapshots/kplot.tgz" "makefile_linux.patch")
sha1sums=('cc3ab77a39f5d1d057f8ed5319b3e1f52c4e9343' '115e6a685440d14efd682ac6a5418b1cb8204099')

prepare() {
	cd "${_pkgname}"
	patch -p1 < ../makefile_linux.patch
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

