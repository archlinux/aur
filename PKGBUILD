# Maintainer: Francesco Pira <dev at fpira dot com>

pkgname=poof-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Magic manager of pre-built software (Prebuilt Binary)"
url="https://github.com/pirafrank/poof"
license=('MIT')
provides=('poof')
conflicts=('poof')

# List ALL Arch-compatible architectures you support
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')

# Dynamic source URL selection based on the build architecture
source_x86_64=("${url}/releases/download/v${pkgver}/poof-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e0b22321ac25df2e8b74f464d0a35602ab8fc05a9b92d86691e9fe6aefc48bbf')

source_aarch64=("${url}/releases/download/v${pkgver}/poof-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('1c35a1e9acbe92f6ad1b36775bd2f7f96c80ac5adc766b3700db1d420d9a5942')

# Note: upstream armv7l maps to Arch armv7h
source_armv7h=("${url}/releases/download/v${pkgver}/poof-${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums_armv7h=('b8d180836b69d350cd3f05ec2481414c221820902819ec4fe7de346d73e5c52d')

source_riscv64=("${url}/releases/download/v${pkgver}/poof-${pkgver}-riscv64gc-unknown-linux-gnu.tar.gz")
sha256sums_riscv64=('7450a5aa43cc974ff00af3552b8e789fcd84033443070e085049c40606ac5837')

package() {
    # Arch automatically downloads only the source_CARCH file
    # But it puts it in srcdir, so you might need a wildcard or specific logic if filenames differ

    install -Dm755 "${srcdir}/poof" "${pkgdir}/usr/bin/poof"
}