# Maintainer: kazormia296 <kazormia296@users.noreply.github.com>

pkgname=mozkey-ibg-bin
pkgver=0.8.2
pkgrel=1
pkgdesc='Mozkey IbG Japanese input method for Fcitx 5 (prebuilt)'
arch=('x86_64')
url='https://github.com/kazormia296/mozkey'
license=('Apache-2.0' 'BSD-3-Clause' 'LGPL-2.1-or-later' 'MIT')
depends=('fcitx5' 'hicolor-icon-theme' 'llama-cpp' 'qt6-base')
provides=("mozkey-ibg=${pkgver}")
conflicts=('mozkey-ibg')
options=('!debug' '!strip')
source_x86_64=(
  "${pkgname}-${pkgver}-${CARCH}.tar.xz::${url}/releases/download/v${pkgver}/mozkey-v${pkgver}-archlinux-${CARCH}.tar.xz"
)
sha256sums_x86_64=('e47558b371253646d8a58d97c0becb764576be9a28478d93619bc34fd0e0e96b')

package() {
  cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
  install -Dm644 "${srcdir}/usr/share/licenses/mozkey/Mozc-LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/BSD-3-Clause.txt"
  install -Dm644 \
    "${srcdir}/usr/share/licenses/mozkey/zenz-runtime/llama.cpp-MIT.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/MIT.txt"
}
