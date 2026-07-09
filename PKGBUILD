# Maintainer: Francesco Pira <dev at fpira dot com>

pkgname=poof-bin
pkgver=0.6.2
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
sha256sums_x86_64=('3410892ae4614764ea4ac66cde0ef9eec7db99800b8fa98de64c5799c817c0c3')

source_aarch64=("${url}/releases/download/v${pkgver}/poof-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('d2ca8db9c09fa50ee9446d6b0dfaf6df20cf3ff633586c5e359cc4b2a698d13f')

# Note: upstream armv7l maps to Arch armv7h
source_armv7h=("${url}/releases/download/v${pkgver}/poof-${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums_armv7h=('8036d2edc1917c8cbb78462d43fa116b2fe21d359b3f11c62984fc6e0086415a')

source_riscv64=("${url}/releases/download/v${pkgver}/poof-${pkgver}-riscv64gc-unknown-linux-gnu.tar.gz")
sha256sums_riscv64=('ab1b615820cd92255340464616abc3624e097a52859ae9e37f3bbfbb3bf8698e')

package() {
    # Arch automatically downloads only the source_CARCH file
    # But it puts it in srcdir, so you might need a wildcard or specific logic if filenames differ

    install -Dm755 "${srcdir}/poof" "${pkgdir}/usr/bin/poof"
}