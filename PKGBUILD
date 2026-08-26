# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=veil-host-bin
pkgver=2.5
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

sha256sums_x86_64=('ef3602971555724bb21d0bb5c1e0c26540dfa354cf4011a1bcd4da3c64d05241'
                    '96226506ad5d20d13ae5ab481bed25ffca30afdcc9040ca8a9f1a0131e9dba0d')
sha256sums_aarch64=('d94a74901ce43d5f07d75150109db4a3f7fa95e69025126369e0a75138f3fc1f'
                     '96226506ad5d20d13ae5ab481bed25ffca30afdcc9040ca8a9f1a0131e9dba0d')

package() {
    install -Dm755 "${srcdir}/veil-host" "${pkgdir}/usr/bin/veil-host"
    install -Dm644 "${srcdir}/config.lua" "${pkgdir}/usr/share/veil-host/config.lua"
}
