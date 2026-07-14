# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switchy-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI/TUI for restoring CC Switch cloud snapshots from WebDAV or S3"
arch=('x86_64' 'aarch64')
url="https://github.com/ca-x/cc-switchy"
license=('MIT')
options=('!debug')
provides=('cc-switchy')
conflicts=('cc-switchy')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/ca-x/cc-switchy/releases/download/v${pkgver}/cc-switchy-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/ca-x/cc-switchy/releases/download/v${pkgver}/cc-switchy-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('f078060dcdb3f97efabf99b470aaf2edd6f29791d41b6986d4b48438d463b0b7')
sha256sums_aarch64=('23cea410f473748d260b989abda77b8199278979ed9527f8ed4c8587c28c3bee')

package() {
    install -Dm755 "${srcdir}/cc-switchy" "${pkgdir}/usr/bin/cc-switchy"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
