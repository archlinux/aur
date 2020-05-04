# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec
pkgver=2.3.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64" "i686")
url="https://github.com/securego/gosec"
license=("Apache")
depends=("glibc")
makedepends=("go")
source=("https://github.com/securego/gosec/archive/v${pkgver}.tar.gz")
sha256sums=('cd4c0041902960314848c23fc05e825d944fed546ea517381d3bd6c5bdc8b109')

build() {
    cd ${pkgname}-${pkgver}/cmd/gosec
    go build
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 cmd/gosec/gosec ${pkgdir}/usr/bin/gosec
}
