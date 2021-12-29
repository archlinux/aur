pkgname="tldr-page"
_pkgname="tldr-page-creator"
pkgver="1.4"
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
sha256sums=('f7de171ed532bb1ea443454b55bd6818b2b723c19effcbaa370029dced7a06c1')
