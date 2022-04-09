pkgname="tldr-page"
_pkgname="tldr-page-creator"
pkgver="1.8"
pkgrel="1"
pkgdesc="Generate tldr-pages using Go"
url="https://github.com/CleanMachine1/tldr-page-creator"
source=("https://github.com/CleanMachine1/tldr-page-creator/archive/v${pkgver}.tar.gz")
arch=('any')
license=('MIT')
makedepends=('go')


build(){
    cd ${_pkgname}-${pkgver}
    go build -o ${pkgname} ./${pkgname}.go
}

package(){
    cd ${_pkgname}-${pkgver}
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/tldr-page"
}
sha256sums=('9a545d539375577c87006e027330d9ea768e9a0f0742cb6f8e3b75eaad2d997e')
