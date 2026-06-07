# Maintainer: Gino O. <aur@1337.io>
# Upstream canonical: https://git.iris.to/#/npub1xdhnr9mrv47kkrn95k6cwecearydeh8e895990n3acntwvmgk2dsdeeycm/nostr-vpn
# GitHub below is the upstream-maintained mirror used for clickable links and release artifacts.
pkgname=nostr-vpn-cli-bin
_pkgname=nvpn
pkgver=4.0.69
pkgrel=1
pkgdesc='nvpn CLI/daemon for Nostr VPN, a Tailscale-style private mesh VPN (prebuilt musl binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/mmalmi/nostr-vpn'
license=('MIT')
depends=()
optdepends=(
  'iproute2: route and tunnel device management for nvpn'
  'systemd: persistent service via `nvpn service install`'
  'nftables: firewall integration on hosts using nftables'
)
provides=("nvpn=${pkgver}" "nostr-vpn-cli=${pkgver}")
conflicts=('nvpn' 'nostr-vpn-cli' 'nostr-vpn-cli-git')
_url_base="https://github.com/mmalmi/nostr-vpn/releases/download/v${pkgver}"
_x86_64_arch="x86_64-unknown-linux-musl"
_aarch64_arch="aarch64-unknown-linux-musl"
_armv7h_arch="arm-unknown-linux-musleabihf"
source_x86_64=("${_url_base}/nvpn-v${pkgver}-${_x86_64_arch}.tar.gz")
source_aarch64=("${_url_base}/nvpn-v${pkgver}-${_aarch64_arch}.tar.gz")
source_armv7h=("${_url_base}/nvpn-v${pkgver}-${_armv7h_arch}.tar.gz")
source=('LICENSE')
sha256sums=('0db560024163fbcc5ee5cff1971684ca448da90088f341db083a38548846c3d5')
sha256sums_x86_64=('863251b029359fcb5812215989aab2e93735c4f8dba5eeb607e32a08e6bb770b')
sha256sums_aarch64=('e22c65074310567c32d1fe9acb948b911b48d26a18506f3b25167652718e9593')
sha256sums_armv7h=('e09696fb0a59bdc959b564add366a07adc2023f34075f6810e79f8ed8963d79a')

package() {
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/README.txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
