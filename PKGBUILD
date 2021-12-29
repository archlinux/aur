pkgname="tldr-page"
_pkgname="tldr-page-creator"
pkgver="1.5"
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
sha256sums=('b6e4ba54bacedb050c85f2189faecdd76ced041fefed8e9775c71ebd4afb63b2')
