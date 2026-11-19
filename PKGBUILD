# Maintainer: czyt <czytcn@gmail.com>
pkgname=hclient-cli-bin
pkgver=1.5.8
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

sha256sums_x86_64=('343a6e43152e70f4f423492c8a205e0acb0de75af387606a84df32051674944d')
sha256sums_aarch64=('801f21bb6d82b94c99d26519c3a4faa82badd0731bc0fbe8c1411b96d7c78e0e')
sha256sums_riscv64=('df7e41c46cdbd7f91b100a818882058b53cc56cce03788d71dd59c3282e085b6')

package() {
    case "$CARCH" in
        x86_64)  _src="${pkgname}-${pkgver}-amd64" ;;
        aarch64) _src="${pkgname}-${pkgver}-arm64" ;;
        riscv64) _src="${pkgname}-${pkgver}-riscv64" ;;
    esac
    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/hclient-cli"
}
