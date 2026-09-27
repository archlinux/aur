# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.2.3
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-1.2.3-x86_64::https://github.com/calagopus/wings/releases/download/release-1.2.3/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-1.2.3-aarch64::https://github.com/calagopus/wings/releases/download/release-1.2.3/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-1.2.3-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.2.3/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-1.2.3-riscv64::https://github.com/calagopus/wings/releases/download/release-1.2.3/wings-rs-riscv64-linux')

sha256sums_x86_64=('1fdcbc47a6fd07e41310fb7510f369c1e8b44128f3ffa5cb196372d97ad68ca1')
sha256sums_aarch64=('75bd85114db77eae327d8ee21cabb95097a2cceeb9ede3d1cf31a5a4d93b3885')
sha256sums_powerpc64le=('9520bf5f4fe975b455e151e24b672b743274f48a8a1c3f4ce13dc842da3f7485')
sha256sums_riscv64=('09ceea4f67b5eee702900914a1475cab43a461e73fa96d1e6dba236dc8bdf8f6')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-1.2.3-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
