# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.5.5
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
sha256sums_x86_64=('85bfbfc10419158ced10a84886f0ce3a22baa22f0e5bc653a4d501a2def8bc18')
sha256sums_aarch64=('39a2289ad39617ce29a0d3ef9c3932c016054079443a06b25b8a69b734fd0f1f')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
  install -dm755 "${pkgdir}/usr/share/snout"
  printf '%s\n' 'pacman' > "${pkgdir}/usr/share/snout/package-managed"
  chmod 644 "${pkgdir}/usr/share/snout/package-managed"
}
