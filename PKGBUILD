# Maintainer: Kyle Manna kyle[at]kylemanna[d0t]com

pkgname=mynewt-newt
pkgver=1.0.0
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
sha512sums=('e7ddb99440dae0c073ac8da4bccf356e7ef07af5b0e52eeee7aa12bb0ac17e284f3f5e094c36aaa62b36235132f7f70400742c20b07fbc64f59d210c4faf2e13')

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

