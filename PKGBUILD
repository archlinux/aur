# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=veil-host-bin
pkgver=3.1
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

sha256sums_x86_64=('a22632c8cb2c194020c1dff87244a1c102fb5f278f253f6a44c6ee65b2f7842c'
  '8576b875703d2869e5c1a21d1fa0bed1029ceb252c21f8b8d6801ed77ee02c3d')
sha256sums_aarch64=('bbec5dc12d07ae66f7e62d20447d36f1305d25bf92bd84737a944463a1ab0121'
  '8576b875703d2869e5c1a21d1fa0bed1029ceb252c21f8b8d6801ed77ee02c3d')

package() {
  install -Dm755 "${srcdir}/veil-host" "${pkgdir}/usr/bin/veil-host"
  install -Dm644 "${srcdir}/config.lua" "${pkgdir}/usr/share/veil-host/config.lua"
}
