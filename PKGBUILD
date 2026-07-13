# Maintainer: Algorant
pkgname=secretspec-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='Declarative secrets, every environment, any provider'
arch=('x86_64' 'aarch64')
url='https://github.com/cachix/secretspec'
license=('Apache-2.0')
depends=('dbus')
provides=('secretspec')
conflicts=('secretspec')
options=('!strip' '!debug')
source_x86_64=("secretspec-${CARCH}-unknown-linux-gnu.tar.xz::https://github.com/cachix/secretspec/releases/download/v${pkgver}/secretspec-${CARCH}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('1a44a210e9ba66a29085680573bdc5d1ff756f2cb7b2d3eb571376e58b217075')
source_aarch64=("secretspec-aarch64-unknown-linux-gnu.tar.xz::https://github.com/cachix/secretspec/releases/download/v${pkgver}/secretspec-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=('faa7324105b66a9740245a95fee10e0716b57d42f342565fcc812eac0f82a9d0')

package() {
  install -Dm755 "${srcdir}/secretspec-${CARCH}-unknown-linux-gnu/secretspec" \
    "${pkgdir}/usr/bin/secretspec"
  install -Dm644 "${srcdir}/secretspec-${CARCH}-unknown-linux-gnu/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/secretspec-${CARCH}-unknown-linux-gnu/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/secretspec-${CARCH}-unknown-linux-gnu/CHANGELOG.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
