# Maintainer: czyt <czytcn@gmail.com>
pkgname=snout-bin
pkgver=0.5.3
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
sha256sums_x86_64=('dce2eeec2ff00c06dc57eefe8a097db47f867bb6c674340d9aaeb520ed0e2723')
sha256sums_aarch64=('7109a512d90344fa1e60b5ad488811d7b52751f577948f2e62641aa068047828')

package() {
  install -Dm755 "${srcdir}/snout-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/snout"
  install -dm755 "${pkgdir}/usr/share/snout"
  printf '%s\n' 'pacman' > "${pkgdir}/usr/share/snout/package-managed"
  chmod 644 "${pkgdir}/usr/share/snout/package-managed"
}
