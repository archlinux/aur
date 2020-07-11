# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname=pebble
pkgver=1.0.1
pkgrel=1
arch=("x86_64")
url="https://github.com/avanciro/pebble"
pkgdesc="Simple cli utility to manage database schema"
makedepends=("go")
source=("${url}/archive/v${pkgver}-beta.tar.gz")
sha256sums=("edc7e8b70e63dc7af75f4f9eef0001603640263c685d90baf31a3162524a6151")

build() {
    cd "${pkgname}-${pkgver}-beta"
    go build ./pebble.go
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-beta/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}