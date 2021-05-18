# Maintainer:  Nigel Kukard <nkukard@lbsd.net>

_commit=f2e9119a8f05e8a0e65aee0a52e4ae35dc8deda2
pkgname=cputool
pkgver=1.0.1
pkgrel=1
pkgdesc='CPUTool is a utility which can be used to control the CPU utilization of almost any process'
arch=('i686' 'x86_64')
url="https://gitlab.devlabs.linuxassist.net/cputool/cputool"
license=('GPL3')
makedepends=('docbook2x')
source=(
	"https://gitlab.devlabs.linuxassist.net/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
)
sha256sums=(
	'7c6230cfd30aed823577f23f4c554e668006a850e6eb3662b94d0d4da9864e5b'
)

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}-${_commit}"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}-${_commit}"
	make DESTDIR="${pkgdir}/" PREFIX=/usr install
}

