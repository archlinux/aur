# Maintainer: kazormia296 <kazormia296@users.noreply.github.com>

pkgname=mozkey-ibg-bin
pkgver=0.10.4
pkgrel=1
pkgdesc='Mozkey IbG Japanese input method for Fcitx 5 (prebuilt)'
arch=('x86_64')
url='https://github.com/kazormia296/mozkey-ibg'
license=('Apache-2.0' 'BSD-3-Clause' 'LGPL-2.1-or-later' 'MIT')
depends=('fcitx5' 'hicolor-icon-theme' 'llama-cpp' 'qt6-base')
provides=("mozkey-ibg=${pkgver}")
conflicts=('mozkey-ibg')
options=('!debug' '!strip')
source_x86_64=(
  "${pkgname}-${pkgver}-${CARCH}.tar.xz::${url}/releases/download/v${pkgver}/mozkey-ibg-v${pkgver}-archlinux-${CARCH}.tar.xz"
)
sha256sums_x86_64=('33b8f01927c35f512fd4a8bdca4c23165f6532766f21e0580673dc6679ef958f')

package() {
  cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
  install -Dm644 "${srcdir}/usr/share/licenses/mozkey-ibg/Mozc-LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/BSD-3-Clause.txt"
  install -Dm644 \
    "${srcdir}/usr/share/licenses/mozkey-ibg/zenz-runtime/llama.cpp-MIT.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/MIT.txt"
}
