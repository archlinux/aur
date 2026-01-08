# Maintainer: czyt <czytcn@gmail.com>
pkgname=rime-wanxiang-updater
pkgver=0.6.0
pkgrel=1
pkgdesc="Rime 万象输入法自动更新工具 - 支持词库、方案、模型的自动检测和更新"
arch=('x86_64' 'aarch64')
url="https://github.com/ca-x/rime-wanxiang-updater"
license=('MIT')
depends=()
provides=('rime-wanxiang-updater')
conflicts=()

source_x86_64=("${pkgname}-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/${pkgname}-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/${pkgname}-linux-arm64")

sha256sums_x86_64=('5705a7c7f4d9651f0fee791e87c505ee4364005c1cd6652f08039fdf3a93c392')
sha256sums_aarch64=('361473f6c2ed91cb9f83785c7fa6a7b1c835f0bee71e5f37ca0ee2e7fa129c54')

package() {
    # 根据架构选择对应的二进制文件
    case "${CARCH}" in
        x86_64)  _binary="${pkgname}-${pkgver}-linux-amd64" ;;
        aarch64) _binary="${pkgname}-${pkgver}-linux-arm64" ;;
    esac

    install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
}
