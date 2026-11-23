# Maintainer: icyleaf <icyleaf.cn at gmail dot com>

pkgname=omawarden-bin
pkgver=0.12.2
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
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.12.2/omawarden-0.12.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('10778b08f647eb6ba32524503290d794acfd4109364b64b661aafda5221ec9d5')
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/icyleaf/omarchy-bitwarden/releases/download/omawarden-0.12.2/omawarden-0.12.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('1b3e6c4e9bc4dfe2d9db8c337eb5b90b97465651d8124f33200e36e6da1318d7')
source=("omawarden-policy.install")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}"/omawarden-*/omawarden "${pkgdir}/usr/bin/omawarden"
    install -Dm644 "${srcdir}"/omawarden-*/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}"/omawarden-*/org.omarchy.plugin.icyleaf.omarchy-bitwarden.policy "${pkgdir}/usr/share/polkit-1/actions/org.omarchy.plugin.icyleaf.omarchy-bitwarden.policy"
}
