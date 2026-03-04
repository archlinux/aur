# Maintainer: Francesco Pira <dev at fpira dot com>

pkgname=poof-bin
pkgver=0.6.1
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
sha256sums_x86_64=('fb493fd43b56d7542085fc3d5c7f007e66723268f54e8537d6788354bc580ccc')

source_aarch64=("${url}/releases/download/v${pkgver}/poof-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('fe434e7119b4e06526459442cf892a34a107d9d8aa50ace79372a0c17a02d338')

# Note: upstream armv7l maps to Arch armv7h
source_armv7h=("${url}/releases/download/v${pkgver}/poof-${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums_armv7h=('f485575e5f1014c7c9a118dc42115b7d497217d41391283604cacf1c38c94c8b')

source_riscv64=("${url}/releases/download/v${pkgver}/poof-${pkgver}-riscv64gc-unknown-linux-gnu.tar.gz")
sha256sums_riscv64=('e51c426cd15bf3db2832552262e6f192c4e8cc6b47dfe30f3cbfdf9db89d03d2')

package() {
    # Arch automatically downloads only the source_CARCH file
    # But it puts it in srcdir, so you might need a wildcard or specific logic if filenames differ

    install -Dm755 "${srcdir}/poof" "${pkgdir}/usr/bin/poof"
}