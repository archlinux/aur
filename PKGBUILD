# Maintainer: Kyle Manna kyle[at]kylemanna[d0t]com

pkgname=mynewt-newt
pkgver=1.3.0
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
sha512sums=('8e229c02c0680aae7da40ca215449fbd20ebd8c95273c3de899bb6fb043f1442bba423b691a9bce36eb625fd196b9b0f25bb557122f87fc35b0b70fd04e3d433')

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

