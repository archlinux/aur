# Maintainer: felinae98 <felinae98@gmail.com>

pkgname=nvrh-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Neovim Remote Helper - remote Neovim experience similar to VSCode Remote"
arch=('x86_64' 'aarch64')
url="https://github.com/mikew/nvrh"
license=('MIT')
provides=('nvrh')
conflicts=('nvrh')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/mikew/nvrh/releases/download/v${pkgver}/nvrh-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/mikew/nvrh/releases/download/v${pkgver}/nvrh-linux-arm64")

sha256sums_x86_64=('f089d926aeca20fd66726317f6511d1500d101fdf09127cdf89c6cc9351ef920')
sha256sums_aarch64=('2a1eabf7d8661e556a712678cdbbfaa19c6ee3455ff3829bd659e6c028693c02')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/nvrh"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/nvrh"
  fi
}
