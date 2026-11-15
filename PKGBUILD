# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.2.10
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-1.2.10-x86_64::https://github.com/calagopus/wings/releases/download/release-1.2.10/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-1.2.10-aarch64::https://github.com/calagopus/wings/releases/download/release-1.2.10/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-1.2.10-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.2.10/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-1.2.10-riscv64::https://github.com/calagopus/wings/releases/download/release-1.2.10/wings-rs-riscv64-linux')

sha256sums_x86_64=('8efc06b95acffe9ea984375a727c9d67ea99647330d0363f2975b1485fc0d87d')
sha256sums_aarch64=('8632c0f08a5780eeb9e71f54d6ab90cc91a731af4c8a029a5b16d091c4287470')
sha256sums_powerpc64le=('4092e8d809909320a4dd494f8c17b55eb444a7411e0a963232264d3dde11a1f5')
sha256sums_riscv64=('f4e3801832b3d9d7f60e88c8e6eb6f880de7b44c15404419569f9aa4b998f288')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-1.2.10-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
