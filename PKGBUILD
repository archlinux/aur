# Maintainer: czyt <czytcn@gmail.com>
pkgname=rime-wanxiang-updater
pkgver=0.6.21
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

sha256sums_x86_64=('5999611f26047a13131e2a3a7ba79602bfa62743b24172534a5f386c90fcbc8b')
sha256sums_aarch64=('a791ebb9f28f4a073bd3f933fce0981df1dfceb430a71a406f62cee0185d1e2a')

package() {
    # 根据架构选择对应的二进制文件
    case "${CARCH}" in
        x86_64)  _binary="${pkgname}-${pkgver}-linux-amd64" ;;
        aarch64) _binary="${pkgname}-${pkgver}-linux-arm64" ;;
    esac

    install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
}
