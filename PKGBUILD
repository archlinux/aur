# Maintainer: Your Name <your.email@example.com>
pkgname=na-tools-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="NekroAI Tools - A collection of utilities for NekroAI (binary release)"
arch=('x86_64')
url="https://github.com/NekroAI/na-tools"
license=('MIT')  # 请根据实际许可证修改
depends=('glibc')
provides=('na-tools')
conflicts=('na-tools')

# 使用 GitHub Releases 的最新版本
source_x86_64=("na-tools-linux-amd64-${pkgver}::https://github.com/NekroAI/na-tools/releases/download/v${pkgver}/na-tools-linux-amd64")
sha256sums_x86_64=('1d323175391fd6427dfeadfbc5ae1c0827037f81aa85e6376c733f6ddd7d56d8')

package() {
    # 安装二进制文件
    install -Dm755 "${srcdir}/na-tools-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/na-tools"
    
    # 如果有 LICENSE 文件，建议添加（可选）
    # install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}