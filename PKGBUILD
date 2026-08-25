# Maintainer: czyt <czytcn@gmail.com>
pkgname=luvus-bin
pkgver=0.12.0
pkgrel=2
pkgdesc="Mission control for your AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/RizRiyz/luvus"
license=('AGPL-3.0-or-later')
provides=('luvus')
conflicts=('luvus')
options=('!strip')

source_x86_64=(
    "luvus-${pkgver}-x86_64.tar.gz::https://github.com/RizRiyz/luvus/releases/download/v${pkgver}/luvus-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
)
source_aarch64=(
    "luvus-${pkgver}-aarch64.tar.gz::https://github.com/RizRiyz/luvus/releases/download/v${pkgver}/luvus-v${pkgver}-aarch64-unknown-linux-musl.tar.gz"
)
sha256sums_x86_64=('2870a1f9386d2e10aecc4e9e5149951eb374c4fd9fb723c1539b154034b2afd2')
sha256sums_aarch64=('1e72ee8c4273b82ef48b9a6535c5f819d9ade6c208bf8d67bb4f15b91c3b4af1')

package() {
    local _archive="${srcdir}/luvus-${pkgver}-${CARCH}.tar.gz"
    install -dm755 "${pkgdir}/usr/bin"
    bsdtar -xOf "${_archive}" luvus > "${pkgdir}/usr/bin/luvus"
    chmod 755 "${pkgdir}/usr/bin/luvus"
}
