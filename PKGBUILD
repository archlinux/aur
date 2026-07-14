# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switchy-bin
pkgver=0.2.1
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
sha256sums_x86_64=('cf16036b50b8587b0bd015ec48dffa3ff5de0cca819ca6bd771da4acfe4f7849')
sha256sums_aarch64=('16a685ab71904602893d77ac8aba63b7d6fee73e0d26133e947c34a8a36be878')

package() {
    install -Dm755 "${srcdir}/cc-switchy" "${pkgdir}/usr/bin/cc-switchy"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
