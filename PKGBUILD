# Maintainer: Kyle Manna kyle[at]kylemanna[d0t]com

pkgname=mynewt-newt
pkgver=1.10.0
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
sha512sums=('6109b0421d8e02d5b83082f8085ccf0904ad7f1997e1d9932fad015d3cb40ab6804571a2466d2a42f3f7970e114ac25b2a9084c3c15e16c46eb01f359ecc0151')

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

