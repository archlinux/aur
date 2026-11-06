# Maintainer: Wimpy <vvinnpy@gmail.com>
# Bootstrap PKGBUILD for the initial AUR submission. Subsequent releases are
# generated from .goreleaser.yaml by the release workflow.

pkgname=whop-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='Local-first terminal connection deck with SSH, sessions, and automation'
arch=('x86_64' 'aarch64')
url='https://github.com/vvinnpy/whop'
license=('MIT')
provides=('whop')
conflicts=('whop')

source_x86_64=(
  "whop_${pkgver}_linux_amd64.tar.gz::${url}/releases/download/v${pkgver}/whop_${pkgver}_linux_amd64.tar.gz"
)
source_aarch64=(
  "whop_${pkgver}_linux_arm64.tar.gz::${url}/releases/download/v${pkgver}/whop_${pkgver}_linux_arm64.tar.gz"
)

sha256sums_x86_64=('a6552eb85b848542d1f1b81a8849919a0f14e6a3b00ac149026f624086f10e1c')
sha256sums_aarch64=('ef4c9c035761476dd216246d30fe8265b2d4a8a25bda217845b057a127e1baec')

package() {
  install -Dm755 "${srcdir}/whop" "${pkgdir}/usr/bin/whop"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
