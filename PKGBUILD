# Maintainer: Kyle Manna kyle[at]kylemanna[d0t]com

pkgname=mynewt-newt
pkgver=0.9.0
_pkgver=${pkgver//./_}
pkgrel=1
epoch=
pkgdesc="A tool to use with the gx package manager for packages written in go."
arch=('x86_64')
url="https://github.com/apache/incubator-mynewt-newt"
license=('Apache')
depends=()
makedepends=('go')
source=("https://github.com/apache/incubator-mynewt-newt/archive/mynewt_${_pkgver}_tag.tar.gz")
sha512sums=('b849032a982ad74e9e9c97101613c745a268571681c44ab0559d2f948da6cea78f89542bb41bf0a0be51d5b56d04e4617e399cf832c9c548e63aa1a18749356f')

build() {
	cd "${srcdir}/incubator-mynewt-newt-mynewt_${_pkgver}_tag"

    msg2 'Building binary...'
	./build.sh
}

package() {
	cd "${srcdir}/incubator-mynewt-newt-mynewt_${_pkgver}_tag"

    msg2 'Packaging binary...'
    install -Dm 755 newt/newt "${pkgdir}/usr/bin/newt"
}

