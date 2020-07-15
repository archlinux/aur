# Maintainer: Tommaso Sardelli <lacapannadelloziotom [AT] gmail [DOT] com>
pkgname=gotest
pkgver=0.0.5
pkgrel=1
pkgdesc='go test with colors'
arch=('x86_64')
url='https://github.com/rakyll/gotest'
license=('BSD')
depends=('go')
conflicts=('gotest-git')
provides=('gotest')
source=("https://github.com/rakyll/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ae4f776c516e3e289a26456f439234a3f6be854f1be40220cfb71320953447cbc21f0fda2e9043fc73f3ac388ac5a9bd7eeb2bacdce2c3f50cb5df60227ac37a')

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
