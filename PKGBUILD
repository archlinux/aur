# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=sfs-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Secure File System - A FUSE-based filesystem with SSH transport"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/sfs"
license=('MIT')
depends=('glibc' 'fuse2')
options=(!strip)
provides=('sfs')
conflicts=('sfs')

source_x86_64=("sfs-${pkgver}-x86_64::https://github.com/skorotkiewicz/sfs/releases/download/v${pkgver}/sfs-x86_64-unknown-linux-gnu")
source_aarch64=("sfs-${pkgver}-aarch64::https://github.com/skorotkiewicz/sfs/releases/download/v${pkgver}/sfs-aarch64-unknown-linux-gnu")

sha256sums_x86_64=('7993bc12101a01fc75bc7be26f20f3ab64b6c513fd6a621af96041f065153e07')
sha256sums_aarch64=('8d8a09c6bf50b353d98e3326fe1f6d9ed34daff18ac89c7e877b509f5e987f9f')

package() {
    cd "${srcdir}"

    # Create installation directory
    install -d "${pkgdir}/usr/bin"

    # Install binary (source is named sfs-${pkgver}-${CARCH})
    install -m755 "sfs-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sfs"
}
