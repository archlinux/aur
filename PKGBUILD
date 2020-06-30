# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname=pebble
pkgver=1.0.0
pkgrel=1
arch=("x86_64")
url="https://github.com/avanciro/pebble"
pkgdesc="Simple cli utility to manage database schema"
makedepends=("go")
source=("${url}/archive/v${pkgver}-beta.tar.gz")
sha256sums=("e7c54f298c96abf123fd62d2a5b370b0abecc175a15585635f842f9de2b8eef9")

build() {
    cd "${pkgname}-${pkgver}-beta"
    go build ./pebble.go
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-beta/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}