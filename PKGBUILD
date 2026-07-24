# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-db-agent-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Database management agent'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('db-agent-1.0.1-x86_64::https://github.com/calagopus/db-agent/releases/download/release-1.0.1/db-agent-x86_64-linux')
source_aarch64=('db-agent-1.0.1-aarch64::https://github.com/calagopus/db-agent/releases/download/release-1.0.1/db-agent-aarch64-linux')
source_powerpc64le=('db-agent-1.0.1-ppc64le::https://github.com/calagopus/db-agent/releases/download/release-1.0.1/db-agent-ppc64le-linux')
source_riscv64=('db-agent-1.0.1-riscv64::https://github.com/calagopus/db-agent/releases/download/release-1.0.1/db-agent-riscv64-linux')

sha256sums_x86_64=('efa1b174a97782881584278a2b7b8ae03d1ac5df166b2494d820efe168de0a4b')
sha256sums_aarch64=('71ae78f191dc40bcab7c4525710a29389c937f0e74ffdf780c2bbb220a90c966')
sha256sums_powerpc64le=('7cceb5ffdf7789681d413c0949acba6db94de0b1892ad401823a860bebe5f010')
sha256sums_riscv64=('c86ba1ef3de964e2b4fd895ec60c243690bdc5e4b24bee4a47997f1817fbdbb1')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/db-agent-1.0.1-${_a}" "${pkgdir}/usr/bin/calagopus-db-agent"
}
