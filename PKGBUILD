# Maintainer: kamisaki
# Description: 🚀🌠 A minimal, fast, and customizable prompt written in Go
pkgname=pulsarship
pkgver=0.2.0
pkgrel=1
pkgdesc="🚀🌠 A minimal, fast, and customizable prompt written in Go"
arch=('x86_64')
url="https://github.com/xeyossr/pulsarship"
license=('GPL3')
depends=()
makedepends=('go' 'git')

source=(
    "git+https://github.com/xeyossr/pulsarship.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}"
    go mod tidy
    go build -o pulsarship
}

package() {
    cd "$srcdir/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}/pulsarship" "${pkgdir}/usr/bin/${pkgname}"
}
