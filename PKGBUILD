# Maintainer: czyt <czytcn@gmail.com>
pkgname=hclient-cli-bin
pkgver=1.1.2
pkgrel=2
pkgdesc="Lazycat Microserver CLI client (懒猫微服命令行客户端)"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://lazycat.cloud/download"
license=('MIT')
provides=('hclient-cli')
conflicts=('hclient-cli')

source_x86_64=("${pkgname}-amd64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-amd64")
source_aarch64=("${pkgname}-arm64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-arm64")
source_riscv64=("${pkgname}-riscv64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-riscv64")

sha256sums_x86_64=('9324605feaf3f7d953e9c05550500e1856c96c7ac8ecf0d855d59e3fd859a9a0')
sha256sums_aarch64=('c85e21a58ede72a8f9b5fbf056b1cdb4d9febe66afb54296d516da961643d33d')
sha256sums_riscv64=('3f250ebc2eff75135997ba7d9a5e89140c896cf86a28207f8a0664e9a5f67ff6')

package() {
    case "$CARCH" in
        x86_64)  _src="${pkgname}-amd64" ;;
        aarch64) _src="${pkgname}-arm64" ;;
        riscv64) _src="${pkgname}-riscv64" ;;
    esac
    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/hclient-cli"
}
