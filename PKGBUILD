# Maintainer: czyt <czytcn@gmail.com>
pkgname=luvus-bin
pkgver=0.14.2
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
sha256sums_x86_64=('39734a22b95049afc8aa8273781a3cae2737d14820dd2ffb765ba48fd8366498')
sha256sums_aarch64=('87d14589463ed0b73975e07e5c8674f1f30dd18e7dbbf9750edf776313f95a59')

package() {
    local _archive="${srcdir}/luvus-${pkgver}-${CARCH}.tar.gz"
    install -dm755 "${pkgdir}/usr/bin"
    bsdtar -xOf "${_archive}" luvus > "${pkgdir}/usr/bin/luvus"
    chmod 755 "${pkgdir}/usr/bin/luvus"
}
