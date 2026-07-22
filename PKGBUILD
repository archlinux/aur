# Maintainer: kazormia296 <kazormia296@users.noreply.github.com>

pkgname=mozkey-ibg-bin
pkgver=0.10.0
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
sha256sums_x86_64=('807c7e65bf2e304ae5e662d9f0fa6049e68d2eaeed8609413c1b4ab7e7b1abab')

package() {
  cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
  install -Dm644 "${srcdir}/usr/share/licenses/mozkey-ibg/Mozc-LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/BSD-3-Clause.txt"
  install -Dm644 \
    "${srcdir}/usr/share/licenses/mozkey-ibg/zenz-runtime/llama.cpp-MIT.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/MIT.txt"
}
