# Maintainer: Kyle Manna kyle[at]kylemanna[d0t]com

pkgname=mynewt-newt
pkgver=1.8.0
_pkgver=${pkgver//./_}
pkgrel=1
epoch=
pkgdesc="A tool to use with the gx package manager for packages written in go."
arch=('x86_64')
url="https://github.com/apache/mynewt-newt"
license=('Apache')
depends=()
makedepends=('go')
source=("https://github.com/apache/mynewt-newt/archive/mynewt_${_pkgver}_tag.tar.gz")
sha512sums=('8c1983c5e3be3a8f1a35627bc4eb854fe11f316653fba86841d3bd2ad8c7dbda70e132b05a1f30b8df531f73bcb8b2d3b84c34e353d0fee9456ff98ea27537b1')

build() {
	cd "${srcdir}/mynewt-newt-mynewt_${_pkgver}_tag"

    msg2 'Building binary...'
	./build.sh
}

package() {
	cd "${srcdir}/mynewt-newt-mynewt_${_pkgver}_tag"

    msg2 'Packaging binary...'
    install -Dm 755 newt/newt "${pkgdir}/usr/bin/newt"
}

