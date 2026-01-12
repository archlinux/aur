# Maintainer: czyt <czytcn@gmail.com>
pkgname=rime-wanxiang-updater
pkgver=0.6.8
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

sha256sums_x86_64=('adb0a6e44205e799b594584bdea8779ce4b18869c5eb3d7f2bf0846aa271481b')
sha256sums_aarch64=('e88708c2ae6715bb0346a9a2fc1e3f694d59a2b3d78b43f30028824eaa972f4e')

package() {
    # 根据架构选择对应的二进制文件
    case "${CARCH}" in
        x86_64)  _binary="${pkgname}-${pkgver}-linux-amd64" ;;
        aarch64) _binary="${pkgname}-${pkgver}-linux-arm64" ;;
    esac

    install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
}
