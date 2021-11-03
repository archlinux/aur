# Maintainer:  Nigel Kukard <nkukard@lbsd.net>

_commit=9c4dbde42d5555f40909177831380eab76b0a8fc
pkgname=cputool
pkgver=1.1.0
pkgrel=1
pkgdesc='CPUTool is a utility which can be used to control the CPU utilization of almost any process'
arch=('i686' 'x86_64')
url="https://gitlab.devlabs.linuxassist.net/cputool/cputool"
license=('GPL3')
makedepends=('meson' 'python-docutils')
source=(
	"https://gitlab.devlabs.linuxassist.net/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
)
sha256sums=(
	'3244d1475ed04975012bc12f356c84cdee81e74ef1377c1c591d737fac653e1b'
)

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}-${_commit}"
	meson --prefix="${pkgdir}/usr" build
	cd build
	ninja
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}-${_commit}"
	cd build
	ninja install
}

