# Maintainer: rustledger team <rustledger@users.noreply.github.com>
pkgname=rustledger-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast, pure Rust implementation of Beancount double-entry accounting (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustledger/rustledger"
license=('GPL-3.0-only')
provides=('rustledger' 'rledger-check' 'rledger-format' 'rledger-query' 'rledger-report' 'rledger-doctor' 'rledger-extract' 'rledger-price')
conflicts=('rustledger')
depends=('glibc')

_pkgver="${pkgver//_/-}"

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/rustledger/rustledger/releases/download/v${_pkgver}/rustledger-v${_pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/rustledger/rustledger/releases/download/v${_pkgver}/rustledger-v${_pkgver}-aarch64-unknown-linux-gnu.tar.gz")

# Update these checksums when releasing new versions
# Run: curl -sL <url> | sha256sum
sha256sums_x86_64=('43058e026e221336587a95d0dd8576ce54757f376435f7a2eb25ae2b8186656e')
sha256sums_aarch64=('fdeacb608b2bbc11b9ce5865bf79461e256235af451a01ce16edbf326790fb55')

package() {
    cd "$srcdir"

    # Install main binaries
    install -Dm755 rledger-check "$pkgdir/usr/bin/rledger-check"
    install -Dm755 rledger-format "$pkgdir/usr/bin/rledger-format"
    install -Dm755 rledger-query "$pkgdir/usr/bin/rledger-query"
    install -Dm755 rledger-report "$pkgdir/usr/bin/rledger-report"
    install -Dm755 rledger-doctor "$pkgdir/usr/bin/rledger-doctor"
    install -Dm755 rledger-extract "$pkgdir/usr/bin/rledger-extract"
    install -Dm755 rledger-price "$pkgdir/usr/bin/rledger-price"

    # Install bean-* compatibility binaries
    install -Dm755 bean-check "$pkgdir/usr/bin/bean-check"
    install -Dm755 bean-format "$pkgdir/usr/bin/bean-format"
    install -Dm755 bean-query "$pkgdir/usr/bin/bean-query"
    install -Dm755 bean-report "$pkgdir/usr/bin/bean-report"
    install -Dm755 bean-doctor "$pkgdir/usr/bin/bean-doctor"
    install -Dm755 bean-extract "$pkgdir/usr/bin/bean-extract"
    install -Dm755 bean-price "$pkgdir/usr/bin/bean-price"
}
