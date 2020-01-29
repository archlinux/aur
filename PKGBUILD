# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec
pkgver=2.1.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64" "i686")
url="https://github.com/securego/gosec"
license=("Apache")
makedepends=("go")
source=("https://github.com/securego/gosec/archive/v${pkgver}.tar.gz")
sha256sums=('0abf214788433bdd1884f3dab03dc9d073a8c7daaf778145bf27905da0feb1fd')

build() {
    cd ${pkgname}-${pkgver}/cmd/gosec
    go build
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 cmd/gosec/gosec ${pkgdir}/usr/bin/gosec
}
