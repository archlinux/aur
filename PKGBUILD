# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec
pkgver=2.2.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64" "i686")
url="https://github.com/securego/gosec"
license=("Apache")
makedepends=("go")
source=("https://github.com/securego/gosec/archive/v${pkgver}.tar.gz")
sha256sums=('362effa1b0bd2798678a5a77b33984db430a432ba56d20feee41cfe35d5def6b')

build() {
    cd ${pkgname}-${pkgver}/cmd/gosec
    go build
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 cmd/gosec/gosec ${pkgdir}/usr/bin/gosec
}
