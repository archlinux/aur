# Maintainer: czyt <czytcn@gmail.com>
pkgname=rime-wanxiang-updater
pkgver=0.6.14
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

sha256sums_x86_64=('8a168e593bcdbce2db5c76bef5e7f0f9432af371381a68906c38482c58e881b2')
sha256sums_aarch64=('352d8593401b51e414a2481aed881922bc9195f5f619fa1d389a2698a2af5fb4')

package() {
    # 根据架构选择对应的二进制文件
    case "${CARCH}" in
        x86_64)  _binary="${pkgname}-${pkgver}-linux-amd64" ;;
        aarch64) _binary="${pkgname}-${pkgver}-linux-arm64" ;;
    esac

    install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
}
