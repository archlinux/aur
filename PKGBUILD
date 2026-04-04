# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=sfs-bin
pkgver=0.2.1
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

sha256sums_x86_64=('90325d75b18843c7f8ec3d2c2af70fed53681bb20af64923d0247cfe9bc72590')
sha256sums_aarch64=('282dbc71a81fd40c906c8f3fbefa37dc0e552ae8d6c2cb2ae9c7fb3b54f95e68')

package() {
    cd "${srcdir}"

    # Create installation directory
    install -d "${pkgdir}/usr/bin"

    # Install binary (source is named sfs-${pkgver}-${CARCH})
    install -m755 "sfs-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sfs"
}
