# Maintainer: Ken Tobias <https://github.com/l1a>
#
# This file is generated from packaging/aur/PKGBUILD.in in the etr repository
# by `just publish-aur` — do not edit it in the AUR repo directly.
#
# Note: the AUR packages `etr` and `etr-bin` are an unrelated tool (an ECMP
# traceroute) that also installs /usr/bin/etr, hence the name and conflicts.

pkgname=etr-terminal-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Reconnecting remote shell over QUIC — a Rust implementation of Eternal Terminal (et)"
arch=('x86_64' 'aarch64')
url="https://github.com/l1a/etr"
license=('GPL-3.0-only')
depends=('glibc' 'libutempter' 'openssh')
conflicts=('etr' 'etr-bin')
source_x86_64=("etr-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/etr-linux-x86_64"
               "etrs-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/etrs-linux-x86_64")
source_aarch64=("etr-${pkgver}-linux-aarch64::${url}/releases/download/v${pkgver}/etr-linux-aarch64"
                "etrs-${pkgver}-linux-aarch64::${url}/releases/download/v${pkgver}/etrs-linux-aarch64")
sha256sums_x86_64=('d021866bcb276f29af269636201a02955e993461b8dc90afd96a85ead554db71'
                   '380def6ccf37d81b0379e2fbfe64d7d8a94081f6c6b76100b47994bd29c63595')
sha256sums_aarch64=('12c2c02e70603a2ff71203707b98a2e7a08beb179bc8779ad54db2a10625ff91'
                    '5d0fe884698ad355647a661a22b4d8aab265a98dea59dbb45eab2f7b440f8aaf')

package() {
    install -Dm755 "${srcdir}/etr-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/etr"
    install -Dm755 "${srcdir}/etrs-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/etrs"
}
