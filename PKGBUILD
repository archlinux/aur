# Maintainer: bitSheriff <root@bitsheriff.dev>
pkgname=git-today
_pkgname=git-today
pkgver=0.1.6
pkgrel=1
pkgdesc="A tool to recap your daily git work"
arch=('x86_64')
url="https://github.com/bitSheriff/git-today"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("${_pkgname}-v${pkgver}.tar.gz::https://github.com/bitSheriff/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e872dac4620b54ba3f38de0f1af6538c39ab000d81e0856271ffbd6d9b3db3f7')

build() {
    cd "${srcdir}/${_pkgname}-v${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${_pkgname}-v${pkgver}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
