# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=fhex-git
pkgver=v2.3.r26.ga7938d6
pkgrel=1
epoch=
pkgdesc="A full-featured hex editor"
arch=(x86_64)
url="https://github.com/echo-devim/fhex"
license=('GPLv3')
depends=(qt5-base qt5-charts)
source=("git+https://github.com/echo-devim/fhex.git")
sha512sums=(SKIP)
pkgver() {
  cd fhex
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
	cd fhex
	qmake .
}

build() {
	cd fhex
	make -j
}

package() {
	cd fhex
	mkdir -p "$pkgdir/usr/bin"
	cp fhex "$pkgdir/usr/bin/"
	# TODO .desktop entry
}
