# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.1.2-x86_64::https://github.com/calagopus/panel/releases/download/release-1.1.2/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.1.2-aarch64::https://github.com/calagopus/panel/releases/download/release-1.1.2/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.1.2-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.1.2/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.1.2-riscv64::https://github.com/calagopus/panel/releases/download/release-1.1.2/panel-rs-riscv64-linux')

sha256sums_x86_64=('d4d6ce42b519e9f073f4a9fdb4591c236a6b8e2741ead6e7278ad97f13e274e2')
sha256sums_aarch64=('2dbff9fe2ab793a2f252cde2b9d9f156724d176e3ef8e9398f40be035913e041')
sha256sums_powerpc64le=('952e95479b8476b2eaf24286b7d16effe1002cccf010625cd2de76b22cef8aa3')
sha256sums_riscv64=('16e33f7fae58fbae4a200e4867f1af03e51e924a6af3369127744663a60a95f1')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.1.2-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
