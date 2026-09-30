# Maintainer: czyt <czytcn@gmail.com>
pkgname=luvus-bin
pkgver=0.14.3
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
sha256sums_x86_64=('1d96580525f23b21143c05850dbd9a1b4fe95e66d7e173dc27aab6caf9b676bf')
sha256sums_aarch64=('6587fae1a661b9e5b97fc030f11e8b1896828dda41a4b22edab2dee7b20ed00d')

package() {
    local _archive="${srcdir}/luvus-${pkgver}-${CARCH}.tar.gz"
    install -dm755 "${pkgdir}/usr/bin"
    bsdtar -xOf "${_archive}" luvus > "${pkgdir}/usr/bin/luvus"
    chmod 755 "${pkgdir}/usr/bin/luvus"
}
