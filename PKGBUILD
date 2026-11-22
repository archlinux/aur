# Maintainer: icyleaf <icyleaf.cn at gmail dot com>

pkgname=omawarden-bin
pkgver=0.12.1
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.12.1/omawarden-0.12.1-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cfde708f5e3ed36f6ed18411412f2d6c317a8806288ed7f31eb0e525d5c3c2d0')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.12.1/omawarden-0.12.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('fde5fa6464368862b819c999f58a12eb062d258cd073f9cc72776797ed89a176')
source=("omawarden-policy.install")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}"/omawarden-*/omawarden "${pkgdir}/usr/bin/omawarden"
    install -Dm644 "${srcdir}"/omawarden-*/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}"/omawarden-*/org.omarchy.plugin.icyleaf.omarchy-bitwarden.policy "${pkgdir}/usr/share/polkit-1/actions/org.omarchy.plugin.icyleaf.omarchy-bitwarden.policy"
}
