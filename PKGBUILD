# Maintainer: Karol Babioch <karol@babioch.de

pkgname=micro_httpd
pkgver=14Aug2014
pkgrel=1
pkgdesc="really small HTTP server"
arch=('x86_64')
url="https://acme.com/software/micro_httpd/"
license=('custom')
depends=('xinetd')
source=("https://acme.com/software/micro_httpd/micro_httpd_${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/man/man8"
    make BINDIR="${pkgdir}/usr/bin" MANDIR="${pkgdir}/usr/man/man8" install
}

md5sums=('a5bb659491e6b01111c58f928cef29e6')
