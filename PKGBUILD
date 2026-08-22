# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=veil-host-bin
pkgver=2.2
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

sha256sums_x86_64=('d0b88a741d0c07a52fbae8e6225c590c0738fc44fa3ccb7ebb725b6b5c9a1148'
                    '9fd8d7d377e1f2de133109997a96bdb67ffb1930a9f8fcfa62fc027179caa72a')
sha256sums_aarch64=('ae566e125bd865899d4fd6b8e57278e88693bbdf3dde5335fae76748700709ea'
                     '9fd8d7d377e1f2de133109997a96bdb67ffb1930a9f8fcfa62fc027179caa72a')

package() {
    install -Dm755 "${srcdir}/veil-host" "${pkgdir}/usr/bin/veil-host"
    install -Dm644 "${srcdir}/config.lua" "${pkgdir}/usr/share/veil-host/config.lua"
}
