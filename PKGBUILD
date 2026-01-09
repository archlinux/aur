# Maintainer: czyt <czytcn@gmail.com>
pkgname=rime-wanxiang-updater
pkgver=0.6.4
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

sha256sums_x86_64=('c6ec78da4bcd5fa4ccf45b9352c32c12cf31b65376f674ec99d287192a786398')
sha256sums_aarch64=('00df0f7fbdb79ac0dd65d90bc29f5a23e411a22cccc26767653ca66ac738244d')

package() {
    # 根据架构选择对应的二进制文件
    case "${CARCH}" in
        x86_64)  _binary="${pkgname}-${pkgver}-linux-amd64" ;;
        aarch64) _binary="${pkgname}-${pkgver}-linux-arm64" ;;
    esac

    install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
}
