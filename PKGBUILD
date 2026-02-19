# Maintainer: Francesco Pira <dev at fpira dot com>

pkgname=vault-conductor-bin
pkgver=0.3.0
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
sha256sums_x86_64=('cea7b7d13f8d53d1c834751184c4c7e16499f0b64b7a887352055ca21c51a2ae')

source_aarch64=("${url}/releases/download/v${pkgver}/vault-conductor-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('1b7f368911847da089c165359a5e1df5a486bfb2c4893c6023d5a6ae803b1b22')

package() {
    # Arch automatically downloads only the source_CARCH file
    # But it puts it in srcdir, so you might need a wildcard or specific logic if filenames differ

    install -Dm755 "${srcdir}/vault-conductor" "${pkgdir}/usr/bin/vault-conductor"
}