# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gh-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="GitHub command line interface client"
arch=('x86_64')
url="https://cli.github.com"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cli/cli/archive/v${pkgver}.tar.gz")
sha256sums=('e3d1c341829f5b885dce9aa2bf4bc84db48072752250f6fdb2d62903caf07cfb')

prepare() {
    cd "cli-${pkgver}"
    mkdir -p build
}

build() {
    cd "cli-${pkgver}"
    make
}

package() {
    install -Dm755 "cli-${pkgver}/bin/gh" "${pkgdir}/usr/bin/gh"
}
