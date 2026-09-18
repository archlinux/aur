# Maintainer: icyleaf <icyleaf.cn at gmail dot com>

pkgname=omawarden-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="High-performance Bitwarden CLI and resident daemon (Designed for Omarchy)"
arch=('x86_64' 'aarch64')
url="https://github.com/icyleaf/omarchy-bitwarden"
license=('MIT')
depends=('libsecret' 'wl-clipboard')
optdepends=('libfido2: WebAuthn / Passkey / FIDO2 security key support')
provides=('omawarden')
conflicts=('omawarden')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.8.0/omawarden-0.8.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cf122e2ff08c30857a5c298929b16a50c58ca513b3cf200946d5859149f35eb5')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.8.0/omawarden-0.8.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('821e2e008e9cf19ce7b759c5693aa9205b072032023549a8bcc3d19558064edd')

package() {
    install -Dm755 "${srcdir}"/omawarden-*/omawarden "${pkgdir}/usr/bin/omawarden"
    install -Dm644 "${srcdir}"/omawarden-*/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
