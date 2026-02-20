# Maintainer: YOUR NAME <your@email.com>

pkgname=tobby-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="The Terminal Obby — a modern IRC client for the terminal (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/OWNER/tobby"
license=('MIT')
# The binary is produced by `bun build --compile`, which embeds the Bun
# runtime — no runtime dependencies needed.
depends=()
makedepends=()
provides=('tobby')
conflicts=('tobby')

source=(
    "LICENSE::https://raw.githubusercontent.com/OWNER/tobby/v${pkgver}/LICENSE"
)
sha256sums=(
    'SKIP'
)

source_x86_64=(
    "tobby-${pkgver}-x86_64::https://github.com/OWNER/tobby/releases/download/v${pkgver}/tobby-x86_64-linux"
)
sha256sums_x86_64=(
    'SKIP'
)

source_aarch64=(
    "tobby-${pkgver}-aarch64::https://github.com/OWNER/tobby/releases/download/v${pkgver}/tobby-aarch64-linux"
)
sha256sums_aarch64=(
    'SKIP'
)

# Do NOT strip — bun --compile embeds the JS bytecode after the ELF sections
# in a non-standard layout that strip will corrupt.
options=('!strip')

package() {
    install -Dm755 "${srcdir}/tobby-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/tobby"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
