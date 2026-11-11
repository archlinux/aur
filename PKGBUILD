# Maintainer: czyt <czytcn@gmail.com>
pkgname=hclient-cli-bin
pkgver=1.5.7
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

sha256sums_x86_64=('db86594506460be52408ccf7351a63e5cb7099052d068db07e1b20daaa7dc9d2')
sha256sums_aarch64=('05a99aeba33d769fce091d1d554558987dede17bf87b0af4e819fef585f30e41')
sha256sums_riscv64=('42ba24372dec402b940547add39ebdcb0122186c223b7b39812e256ef43ab6a0')

package() {
    case "$CARCH" in
        x86_64)  _src="${pkgname}-${pkgver}-amd64" ;;
        aarch64) _src="${pkgname}-${pkgver}-arm64" ;;
        riscv64) _src="${pkgname}-${pkgver}-riscv64" ;;
    esac
    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/hclient-cli"
}
