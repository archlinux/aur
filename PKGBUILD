# Maintainer: Kyle Manna kyle[at]kylemanna[d0t]com

pkgname=mynewt-newt
pkgver=1.15.0
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
sha512sums=('c184ae89dd54a698a94eb0809a1a7d65e0544053a86cedaffb37e5b5912999c956ac6759bc9ae0106f26249c038329a1aa4628c773d307fae11bac5d527b114d')

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
