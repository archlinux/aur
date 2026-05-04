# Maintainer: tmih06 <tmih.real@gmail.com>
pkgname=zkode
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal coding-agent harness"
arch=('x86_64')
url="https://github.com/tmih06/zkode"
license=('MIT')
makedepends=('cargo' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tmih06/zkode/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/zkode-${pkgver}"
    cargo build --release --locked
}

package() {
    install -Dm755 "${srcdir}/zkode-${pkgver}/target/release/zkode" "${pkgdir}/usr/bin/zkode"
}
