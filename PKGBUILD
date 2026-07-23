# Maintainer: czyt <czytcn@gmail.com>
pkgname=hclient-cli-bin
pkgver=1.1.4
pkgrel=2
pkgdesc="Lazycat Microserver CLI client (懒猫微服命令行客户端)"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://lazycat.cloud/download"
license=('MIT')
provides=('hclient-cli')
conflicts=('hclient-cli')

source_x86_64=("${pkgname}-${pkgver}-amd64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-arm64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-arm64")
source_riscv64=("${pkgname}-${pkgver}-riscv64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-riscv64")

sha256sums_x86_64=('47519ae0378506b098634545ab2989861ae58a0c367d77481a23cb47495767cd')
sha256sums_aarch64=('e7bb81fd8f66d2b3ac9ea3810ca4d97d6ff5a53c7e375a893938d5f270e084f5')
sha256sums_riscv64=('f2d8b1943f59ceb2e00667843bce84f5cd4503ce4654372843970a731c6de416')

package() {
    case "$CARCH" in
        x86_64)  _src="${pkgname}-${pkgver}-amd64" ;;
        aarch64) _src="${pkgname}-${pkgver}-arm64" ;;
        riscv64) _src="${pkgname}-${pkgver}-riscv64" ;;
    esac
    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/hclient-cli"
}
