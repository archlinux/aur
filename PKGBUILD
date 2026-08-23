# Maintainer: czyt <czytcn@gmail.com>
pkgname=hclient-cli-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Lazycat Microserver CLI client (懒猫微服命令行客户端)"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://lazycat.cloud/download"
license=('MIT')
provides=('hclient-cli')
conflicts=('hclient-cli')

source_x86_64=("${pkgname}-${pkgver}-amd64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-arm64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-arm64")
source_riscv64=("${pkgname}-${pkgver}-riscv64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-riscv64")

sha256sums_x86_64=('a0cdebcb652bdae4ba26ff96827c558f368af0673ad910545b4499f9897cfa6c')
sha256sums_aarch64=('348c55c87a4c345ea9c0591eba308e7b286b34096543b1e47e4e2457c5832ede')
sha256sums_riscv64=('32af44f2adda9a4cc696716a6512f176f63e627347f1918e8ec876ee4cf55404')

package() {
    case "$CARCH" in
        x86_64)  _src="${pkgname}-${pkgver}-amd64" ;;
        aarch64) _src="${pkgname}-${pkgver}-arm64" ;;
        riscv64) _src="${pkgname}-${pkgver}-riscv64" ;;
    esac
    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/hclient-cli"
}
