# Maintainer: Algorant
pkgname=secretspec-bin
pkgver=0.20.0
pkgrel=1
pkgdesc='Declarative secrets, every environment, any provider'
arch=('x86_64' 'aarch64')
url='https://github.com/cachix/secretspec'
license=('Apache-2.0')
depends=('dbus')
provides=('secretspec')
conflicts=('secretspec')
options=('!strip' '!debug')
source_x86_64=("secretspec-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::https://github.com/cachix/secretspec/releases/download/v${pkgver}/secretspec-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('34d34c148c465c809df5475261698295bd9117e5277d6793ec797026d4262114')
source_aarch64=("secretspec-${pkgver}-aarch64-unknown-linux-gnu.tar.xz::https://github.com/cachix/secretspec/releases/download/v${pkgver}/secretspec-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=('25b83dbc7b851bb340f3841a19d046a1639029f191858e0b3f11e2ebb62336f2')

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
