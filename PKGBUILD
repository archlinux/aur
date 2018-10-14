# Maintainer: 13thfloorelevators <the13thfloorelevators@protonmail.com> <BURST-737A-XKSG-M424-67UVT>

pkgname=engraver-git
_realname=engraver
_realname2=plot64
pkgver=v0.9.1.r0.gc8f1c96
pkgrel=1
pkgdesc="PoCC reference plotter for BURST"
arch=(x86_64)
url="https://github.com/PoC-Consortium/engraver"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/PoC-Consortium/${_realname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_realname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "${srcdir}/${_realname}"
        make
}

package() {
        cd "${srcdir}/${_realname}"
        install -Dm755 "${_realname2}" "${pkgdir}/usr/bin/${_realname2}"
	install -Dm755 "mshabal_sse4.o" "${pkgdir}/usr/bin/mshabal_sse4.o"
	install -Dm755 "mshabal256_avx2.o" "${pkgdir}/usr/bin/mshabal256_avx2.o"
	install -Dm755 "shabal64.o" "${pkgdir}/usr/bin/shabal64.o"
	install -Dm755 "helper64.o" "${pkgdir}/usr/bin/helper64.o"
}


