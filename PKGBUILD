# Maintainer: bitSheriff <root@bitsheriff.dev>
pkgname=git-today
_pkgname=git-today
pkgver=0.1.7
pkgrel=1
pkgdesc="A tool to recap your daily git work"
arch=('x86_64')
url="https://github.com/bitSheriff/git-today"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("${_pkgname}-v${pkgver}.tar.gz::https://github.com/bitSheriff/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('efbe8734f76d63f4a252f20fcb9c855e5ea28879c98d4ce2380c9d9b75646338')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
