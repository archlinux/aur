# Maintainer: icyleaf <icyleaf.cn at gmail dot com>

pkgname=omawarden-bin
pkgver=0.12.0
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.12.0/omawarden-0.12.0-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('34d74ff11320df0fbeb829b8d05e203b638b94fcfcd40c9d0f67eafca453a6be')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.12.0/omawarden-0.12.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('1c54eb5591067ce1b084b28c4eec2bcf2919658228b2011cd0597fa25b39a038')
source=("omawarden-policy.install")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}"/omawarden-*/omawarden "${pkgdir}/usr/bin/omawarden"
    install -Dm644 "${srcdir}"/omawarden-*/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}"/omawarden-*/org.omarchy.plugin.icyleaf.omarchy-bitwarden.policy "${pkgdir}/usr/share/polkit-1/actions/org.omarchy.plugin.icyleaf.omarchy-bitwarden.policy"
}
