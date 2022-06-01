# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=geneabacus
pkgver=0.1
pkgrel=1
pkgdesc="Gene counter and profiler."
arch=("x86_64")
url="https://github.com/vejnar/GeneAbacus"
license=("MPLv2")
makedepends=("go")
source=("https://github.com/vejnar/GeneAbacus/archive/v${pkgver}.tar.gz" )
sha1sums=("9a582298ffaaa8109eb2a09f40c3804746323c3b")

build() {
    cd "$srcdir/GeneAbacus-${pkgver}"
    export GOPATH="${srcdir}" GOROOT_FINAL="/usr/bin"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build ./cmd/...
}

package() {
    cd "$srcdir/GeneAbacus-${pkgver}"
    install -Dm 755 geneabacus -t "${pkgdir}/usr/bin"
}
