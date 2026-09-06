# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.2.0-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.0/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.2.0-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.0/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.2.0-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.0/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.2.0-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.0/panel-rs-riscv64-linux')

sha256sums_x86_64=('cd6eb88f75d8f4c5fd8789eb5d5c2684230cbc83b0c985f93477041affe38a95')
sha256sums_aarch64=('2b6999f3a602dc5798ef47cf84a4a6fa50d911c53e2f335974a3b1819849c818')
sha256sums_powerpc64le=('b8f3fe034e3a0a9588392296afcfc5294bffaf07ca4173d1c0ce3275137aedd3')
sha256sums_riscv64=('a7b5dd1109ca9d2ccfa96688c36ce85c7a37fed2ae7dd9ded94105266e03fe1b')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.2.0-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
