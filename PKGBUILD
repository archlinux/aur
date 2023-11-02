# Maintainer: Tommaso Sardelli <lacapannadelloziotom [AT] gmail [DOT] com>
pkgname=gotest
pkgver=0.0.6
pkgrel=1
pkgdesc='go test with colors'
arch=('x86_64')
url='https://github.com/rakyll/gotest'
license=('BSD')
depends=('go')
conflicts=('gotest-git')
provides=('gotest')
source=("https://github.com/rakyll/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('19817979ced1a971cf71d3f801e6e6d631054c2fa1359ec6bfa92ecaea56d17bdc36a48648ccde107660936541fc7be5ff5d5536ffc821b6edc1fe2b0d9ab19d')

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
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
