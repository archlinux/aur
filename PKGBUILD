# Maintainer: czyt <czytcn@gmail.com>
pkgname=rime-wanxiang-updater
pkgver=0.5.9
pkgrel=1
pkgdesc="Rime 万象输入法自动更新工具 - 支持词库、方案、模型的自动检测和更新"
arch=('x86_64' 'aarch64')
url="https://github.com/ca-x/rime-wanxiang-updater"
license=('MIT')
depends=()
provides=('rime-wanxiang-updater')
conflicts=()

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}-linux-amd64")
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}-linux-arm64")

sha256sums_x86_64=('f3923b608e401c9508481c2dbdd9bab0c2444ee077f4d0d4f2a749db32f30404')
sha256sums_aarch64=('16be17ce8a992b14e84098257eecff0f6799814ef9754bd5e83a958fd9eb96c5')

package() {
    # 根据架构选择对应的二进制文件
    case "${CARCH}" in
        x86_64)  _binary="${pkgname}-linux-amd64" ;;
        aarch64) _binary="${pkgname}-linux-arm64" ;;
    esac

    install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
}
