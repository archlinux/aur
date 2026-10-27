# Maintainer: icyleaf <icyleaf.cn at gmail dot com>

pkgname=omawarden-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="High-performance Bitwarden CLI and resident daemon (Designed for Omarchy)"
arch=('x86_64' 'aarch64')
url="https://github.com/icyleaf/omarchy-bitwarden"
license=('MIT')
depends=('libsecret' 'wl-clipboard')
optdepends=('libfido2: WebAuthn / Passkey / FIDO2 security key support')
provides=('omawarden')
conflicts=('omawarden')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.10.2/omawarden-0.10.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('394b4d8e3043f2259131cedcb37e1aa23de513819aa021ebe85e67de7a6cb4b4')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.10.2/omawarden-0.10.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('655aec4be3a4b40bb649ced73e0ee4feb361f072a40b9b38cd58dd1a451fe748')

package() {
    install -Dm755 "${srcdir}"/omawarden-*/omawarden "${pkgdir}/usr/bin/omawarden"
    install -Dm644 "${srcdir}"/omawarden-*/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
