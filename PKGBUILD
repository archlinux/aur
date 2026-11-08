# Maintainer: Francesco Pira <dev at fpira dot com>

pkgname=poof-bin
pkgver=0.6.3
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
sha256sums_x86_64=('5b9a3f4071b2a645bbe2f46555d712a34f53af37ca718888629b9b4b00f14547')

source_aarch64=("${url}/releases/download/v${pkgver}/poof-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('e0bd20021196e0fabe048ba9c302a8bb528184f3cb60475dfd5274b270c5d3e5')

# Note: upstream armv7l maps to Arch armv7h
source_armv7h=("${url}/releases/download/v${pkgver}/poof-${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums_armv7h=('a75d966b5c7bb39287a75d4ee6cbd5263c04cf026ffd46987baa5f58f2a75e67')

source_riscv64=("${url}/releases/download/v${pkgver}/poof-${pkgver}-riscv64gc-unknown-linux-gnu.tar.gz")
sha256sums_riscv64=('9f9f8fba79a816699c30f089107230da3d8d7091988f95b02d903b5c6a195211')

package() {
    # Arch automatically downloads only the source_CARCH file
    # But it puts it in srcdir, so you might need a wildcard or specific logic if filenames differ

    install -Dm755 "${srcdir}/poof" "${pkgdir}/usr/bin/poof"
}