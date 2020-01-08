# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname=ghcide
pkgver=0.0.5
pkgrel=1
pkgdesc="A library for building Haskell IDE tooling"
arch=('x86_64')
url="https://github.com/digital-asset/ghcide"
license=('Apache')
makedepends=('git' 'stack')
source=("${pkgname}-${pkgver}::git://github.com/digital-asset/${pkgname}.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    stack build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    stack --local-bin-path "${pkgdir}/usr/bin/" install
}
