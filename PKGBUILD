# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="Rime input method init and update tool with Wanxiang, Ice, Frost, and Mint support"
arch=('x86_64' 'aarch64')
url="https://github.com/ca-x/snout"
license=('MIT')
depends=()
provides=('snout')
conflicts=('snout')
options=('!strip' '!debug')
source_x86_64=("snout-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/snout-v${pkgver}-linux-x86_64")
source_aarch64=("snout-${pkgver}-linux-aarch64::${url}/releases/download/v${pkgver}/snout-v${pkgver}-linux-aarch64")
sha256sums_x86_64=('cc6e2ad21b7becec427a6185c3320d7359387bdc1efa4c42b85d42aa0be95770')
sha256sums_aarch64=('05a4b6e50decbe3228751ef678879bb2bfb2d8fe79bdd5a3cb9177377009ee0e')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
  install -dm755 "${pkgdir}/usr/share/snout"
  printf '%s\n' 'pacman' > "${pkgdir}/usr/share/snout/package-managed"
  chmod 644 "${pkgdir}/usr/share/snout/package-managed"
}
