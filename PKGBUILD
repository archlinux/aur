# Maintainer: Algorant
pkgname=secretspec-bin
pkgver=0.19.1
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
sha256sums_x86_64=('9a0b5882532f5ffbb1c687d9284fa8041949962b05f14fc131050f86c70e1efc')
source_aarch64=("secretspec-aarch64-unknown-linux-gnu.tar.xz::https://github.com/cachix/secretspec/releases/download/v${pkgver}/secretspec-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=('9b0804932f011ee13709d06a342cd7d30222a764bb62d343771964471b2a7e25')

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
