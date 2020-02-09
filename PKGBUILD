# Maintainer: Kyle Manna kyle[at]kylemanna[d0t]com

pkgname=mynewt-newt
pkgver=1.7.0
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
sha512sums=('ea3ff490bf1322127a1c7c3b77a6f4289b94d66b7c7bf7ad8e5749ef0da73c7a3afdbf297e1f53a28da2e93f1f31ffa170a5433dc7dff36736a279f8d3e0b5f1')

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

