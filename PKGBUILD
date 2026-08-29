# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=veil-host-bin
pkgver=2.7
pkgrel=1
pkgdesc="Nested Wayland compositor — run any GUI app inside your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/viewerofall/veilTDC"
license=('MIT')
provides=('veil-host')
conflicts=('veil-host')

install=veil-host-bin.install

source_x86_64=("veil-host::https://github.com/viewerofall/veilTDC/releases/download/v${pkgver}/veil-host-x86_64-unknown-linux-gnu"
  "config.lua::https://raw.githubusercontent.com/viewerofall/veilTDC/v${pkgver}/config.lua")
source_aarch64=("veil-host::https://github.com/viewerofall/veilTDC/releases/download/v${pkgver}/veil-host-aarch64-unknown-linux-gnu"
  "config.lua::https://raw.githubusercontent.com/viewerofall/veilTDC/v${pkgver}/config.lua")

sha256sums_x86_64=('bc6ac1dfbf3b4f4944fd7823f531f50fb2f34e2fc1f8a30ba7ff3479a673e54e'
  '8576b875703d2869e5c1a21d1fa0bed1029ceb252c21f8b8d6801ed77ee02c3d')
sha256sums_aarch64=('2603cf8f2af700408c7173f1bbbf4071456dedca5c46fe942aadbcd68b31374d'
  '8576b875703d2869e5c1a21d1fa0bed1029ceb252c21f8b8d6801ed77ee02c3d')

package() {
  install -Dm755 "${srcdir}/veil-host" "${pkgdir}/usr/bin/veil-host"
  install -Dm644 "${srcdir}/config.lua" "${pkgdir}/usr/share/veil-host/config.lua"
}
