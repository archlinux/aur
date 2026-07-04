# Maintainer: viewerofall <gallia2717@yahoo.com>
pkgname=veil-host-bin
pkgver=2.1
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

sha256sums_x86_64=('eaf70c90f2a573fa2274a32c981ee4a28a3cf586986d38ccad6242efb69daf5f'
                    '9fd8d7d377e1f2de133109997a96bdb67ffb1930a9f8fcfa62fc027179caa72a')
sha256sums_aarch64=('bcc767a281b7c892eeb575af9ee4e6c8548b7e0f0a9226e350cc2e098cfaacfe'
                     '9fd8d7d377e1f2de133109997a96bdb67ffb1930a9f8fcfa62fc027179caa72a')

package() {
    install -Dm755 "${srcdir}/veil-host" "${pkgdir}/usr/bin/veil-host"
    install -Dm644 "${srcdir}/config.lua" "${pkgdir}/usr/share/veil-host/config.lua"
}
