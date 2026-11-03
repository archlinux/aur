# Maintainer: icyleaf <icyleaf.cn at gmail dot com>

pkgname=omawarden-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="High-performance Bitwarden CLI and resident daemon (Designed for Omarchy)"
arch=('x86_64' 'aarch64')
url="https://github.com/icyleaf/omarchy-bitwarden"
license=('MIT')
depends=('libsecret' 'wl-clipboard')
optdepends=('libfido2: WebAuthn / Passkey / FIDO2 security key support')
provides=('omawarden')
conflicts=('omawarden')
install='omawarden-policy.install'
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.11.0/omawarden-0.11.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('444f6e0de08642eca0ee7d6f9d7dc0338e105239ba1840eb81918087ccb917fb')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.11.0/omawarden-0.11.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('aa3b20ea4bb04c7e7506ce08f89ee0430917cb7c171aed35af3f0da745a82288')
source=("omawarden-policy.install")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}"/omawarden-*/omawarden "${pkgdir}/usr/bin/omawarden"
    install -Dm644 "${srcdir}"/omawarden-*/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}"/omawarden-*/org.omarchy.plugin.icyleaf.omarchy-bitwarden.policy "${pkgdir}/usr/share/polkit-1/actions/org.omarchy.plugin.icyleaf.omarchy-bitwarden.policy"
}
