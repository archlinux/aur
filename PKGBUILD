# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.2.9
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.2.9-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.9/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.2.9-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.9/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.2.9-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.9/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.2.9-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.9/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('298e92cc64ec5cf317f7724fde4ba9fb04a223aeac356c6d356e0e0ce5b5c889')
sha256sums_aarch64=('4265882a7fd4f11b2aaac94d57f26a5680757a4b6dcdf168d6f1a0bda8dfcc91')
sha256sums_powerpc64le=('9b9b489587b30ecd78abaebcb420f7efdf3edef08c0941634ceb083abd67d17d')
sha256sums_riscv64=('10917cd4b96d1f454061a5a5792698cf741d8de7c78d182cc07f7f8ea7d2797e')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.2.9-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
