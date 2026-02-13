# $Id$
# Maintainer: Joel Jensen <yobert@gmail.com>
pkgname='repo-isnew'
pkgver=0.0.1
pkgrel=1
pkgdesc='Go tool to complement the arch linux repo-add and repo-remove scripts '
arch=('x86_64')
url='https://github.com/yobert/repo-isnew'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=()
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/yobert/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=(
    '68993a8c48e424801696faf09f34caa3c2616d468958352f673ba1bdca8decae08ce55c4611e3f65929a8d40386f132d7b3f50dc341293f5e6f12f25b6e043e6'
)
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build

}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go test ./...
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -d ${pkgdir}/usr/bin
    cp -a repo-isnew ${pkgdir}/usr/bin/
}
