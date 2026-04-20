# Maintainer: Xavier Olive <git@xoolive.org>
pkgname=dabradio-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A DAB/DAB+ digital radio decoder"
arch=('x86_64' 'aarch64')
url="https://github.com/xoolive/desperado"
license=('MIT')
depends=('alsa-lib')
provides=('dabradio')
conflicts=('dabradio')

source_x86_64=("${url}/releases/download/v${pkgver}/dabradio-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/dabradio-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('87e1cb28d82b3acaf704b50096ca2ba65cbc56a1b878a00190bb919d93bc6505')
sha256sums_aarch64=('aec0c0d69ef193d225c0676fff19db1a5633de96072fc1886de536c2d46210a6')

package() {
    cd "dabradio-${CARCH}-unknown-linux-gnu"
    install -Dm755 "dabradio" "${pkgdir}/usr/bin/dabradio"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/dabradio/readme.md"
}
