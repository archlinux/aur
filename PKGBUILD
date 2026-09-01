# Maintainer: czyt <czytcn@gmail.com>
pkgname=luvus-bin
pkgver=0.13.4
pkgrel=1
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
sha256sums_x86_64=('5a544c93cdca526d48a52eb40ec46a802459dd385a7d240dc0af5c8dc1df1cdd')
sha256sums_aarch64=('24a6350e7be409f334fa252494caf7710839cb884844d6c373c9550c8f380167')

package() {
    local _archive="${srcdir}/luvus-${pkgver}-${CARCH}.tar.gz"
    install -dm755 "${pkgdir}/usr/bin"
    bsdtar -xOf "${_archive}" luvus > "${pkgdir}/usr/bin/luvus"
    chmod 755 "${pkgdir}/usr/bin/luvus"
}
