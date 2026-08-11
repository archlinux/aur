# Maintainer: Francesco Pira <dev at fpira dot com>

pkgname=vault-conductor-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="An SSH Agent that provides SSH keys stored in Bitwarden Secrets Manager"
url="https://github.com/pirafrank/vault-conductor"
license=('MIT')
provides=('vault-conductor')
conflicts=('vault-conductor')

# List ALL Arch-compatible architectures you support
arch=('x86_64' 'aarch64')

# Dynamic source URL selection based on the build architecture
source_x86_64=("${url}/releases/download/v${pkgver}/vault-conductor-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('026a376d625a3539ec7d5820b6a2d43911498dc4bf538cba185e75bbe2073a2d')

source_aarch64=("${url}/releases/download/v${pkgver}/vault-conductor-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('06e1aa2e87a3cd611de1fad0017410b0cc3bc815ef947c05fb2bfb2b67e60b30')

package() {
    # Arch automatically downloads only the source_CARCH file
    # But it puts it in srcdir, so you might need a wildcard or specific logic if filenames differ

    install -Dm755 "${srcdir}/vault-conductor" "${pkgdir}/usr/bin/vault-conductor"
}