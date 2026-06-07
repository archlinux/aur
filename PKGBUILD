# Maintainer: czyt <czytcn@gmail.com>
pkgname=hclient-cli-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Lazycat Microserver CLI client (懒猫微服命令行客户端)"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://lazycat.cloud/download"
license=('MIT')
provides=('hclient-cli')
conflicts=('hclient-cli')

source_x86_64=("${pkgname}-amd64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-amd64")
source_aarch64=("${pkgname}-arm64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-arm64")
source_riscv64=("${pkgname}-riscv64::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-riscv64")

sha256sums_x86_64=('77bfdc49f3abfffd1b1c1cb8ea1962a80680a3dcdf9c360a8f103d640c34d84e')
sha256sums_aarch64=('b0bbb299e1b799bc74811562234e0ae93d97b8ff12f5091b1dc5fbc66c4d8963')
sha256sums_riscv64=('7f851753b7f0c75a5e194f868d9eb94cf32ec824af4148daf3a76f4ebe6ccdd5')

package() {
    case "$CARCH" in
        x86_64)  _src="${pkgname}-amd64" ;;
        aarch64) _src="${pkgname}-arm64" ;;
        riscv64) _src="${pkgname}-riscv64" ;;
    esac
    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/hclient-cli"
}
