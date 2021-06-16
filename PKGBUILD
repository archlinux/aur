# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=gotestsum
pkgver=1.6.4
pkgrel=1
pkgdesc='run go tests with formatted test output and a summar of the test run'
arch=('x86_64')
url='https://github.com/gotestyourself/gotestsum'
license=('Apache-2.0')
depends=('go')
source=("https://github.com/gotestyourself/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('147f97e3f595de6175866f4b43e76282206b98b2764853559411ac7701070475289b27bb5a1941886232af2a38df252b1a9ad57cc04b3851f3b5e929bdd95400')

prepare() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    go mod download
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    go build 
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
