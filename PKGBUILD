# Maintainer: bitSheriff <root@bitsheriff.dev>
pkgname=git-today
_pkgname=git-today
pkgver=0.1.5
pkgrel=1
pkgdesc="A tool to recap your daily git work"
arch=('x86_64')
url="https://github.com/bitSheriff/git-today"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("${_pkgname}-v${pkgver}.tar.gz::https://github.com/bitSheriff/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('35362ea0260c40089b26dd8a088a302b5018086ae328245053f419af533a4f60')

build() {
    cd "${srcdir}/${_pkgname}-v${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${_pkgname}-v${pkgver}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
