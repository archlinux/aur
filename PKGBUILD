# Maintainer: bitSheriff <root@bitsheriff.dev>
pkgname=git-today
_pkgname=git-today
pkgver=0.1.3
pkgrel=1
pkgdesc="A tool to recap your daily git work"
arch=('x86_64')
url="https://github.com/bitSheriff/git-today"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("${_pkgname}-v${pkgver}.tar.gz::https://github.com/bitSheriff/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d2baf8b4aa39090008ccc7cfd57f6680915c9fda8b17b1b713f7790cc5d58c13')

build() {
    cd "${srcdir}/${_pkgname}-v${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${_pkgname}-v${pkgver}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
