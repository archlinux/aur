# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.2.8
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-1.2.8-x86_64::https://github.com/calagopus/wings/releases/download/release-1.2.8/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-1.2.8-aarch64::https://github.com/calagopus/wings/releases/download/release-1.2.8/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-1.2.8-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.2.8/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-1.2.8-riscv64::https://github.com/calagopus/wings/releases/download/release-1.2.8/wings-rs-riscv64-linux')

sha256sums_x86_64=('69bd4fa7ed0d92391c9a32659b3f30f02f0c2b86217b95d8fcc889d2137febe6')
sha256sums_aarch64=('67a0e183e4357d9d966b57fdfef9d152537d346a7269e8383632c7bf88e60bcd')
sha256sums_powerpc64le=('5939b27c9fcafc7836385a76a7ee0b9f134e62b9989378f7f202bb56de8c7db8')
sha256sums_riscv64=('4ea7952540e6e5a4883a3f280eaf4d16310c96f154a468163c762c8cb8500c99')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-1.2.8-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
