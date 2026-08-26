# Maintainer: czyt <czytcn@gmail.com>
pkgname=luvus-bin
pkgver=0.13.1
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
sha256sums_x86_64=('6c6771c7f627a4f581db8e907ec026d1d616cfc880e070619fdcf54966674206')
sha256sums_aarch64=('7de61c32e690d4b8132ad3e29476e408731d279951838da71dbb5c3a2c7f8d76')

package() {
    local _archive="${srcdir}/luvus-${pkgver}-${CARCH}.tar.gz"
    install -dm755 "${pkgdir}/usr/bin"
    bsdtar -xOf "${_archive}" luvus > "${pkgdir}/usr/bin/luvus"
    chmod 755 "${pkgdir}/usr/bin/luvus"
}
