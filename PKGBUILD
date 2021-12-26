pkgname="tldr-page"
_pkgname="tldr-page-creator"
pkgver="1.3"
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
sha256sums=('927314b4b199f32aeb68bf39ae9ba8c24b188fd0bd829cc86d1c3cc6cb56ee98')
