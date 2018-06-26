# Maintainer: Jannick Hemelhof <mister dot jannick at gmail dot com>

pkgname=node-prune
pkgver=1.0.1
pkgrel=1
pkgdesc="Remove unnecessary files from node_modules"
arch=('x86_64')
url="https://github.com/tj/node-prune"
license=('MIT')
makedepends=('go')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/tj/node-prune/archive/v1.0.1.tar.gz"
    )
sha512sums=('35896924bd1640c2500fdf7c36fa31479d44772930ef8a21b0e707c663cc467d71c41f717e169aed6b812791588e2852020acfe0f657cd6eff890c64f8fa4dc8')

build() {
    cd "${pkgname}-${pkgver}"

    go build cmd/"${pkgname}"/main.go
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 main "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}