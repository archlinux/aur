# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=webfsd
pkgver=1.21
pkgrel=1
pkgdesc="A simple HTTP server for mostly static content written in C"
arch=("any")
url="https://github.com/ourway/webfsd"
license=("GPL-2.0-or-later")
depends=("openssl")
makedepends=("gcc" "make")
provides=("webfsd")
conflicts=("webfsd")
source=("https://github.com/ourway/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=("420177e8e7f0a74e722cf642ed00179a8f42a1ad35a38f9e8852faed866fb8d612c438d6f467df7c8b376d3affc7fb471b96bd048dab29033de6adaf6214e976")

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install bindir=${pkgdir}/usr/bin mandir=${pkgdir}/usr/share/man
}
