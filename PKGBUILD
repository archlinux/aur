# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.231
pkgrel=1
pkgdesc="A tool to manage and use Alibaba Cloud resources through a command line interface.(Prebuilt version)"
url="https://github.com/aliyun/aliyun-cli"
arch=(
    'aarch64'
    'x86_64'
)
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-cli-bin}"
    "${pkgname%-bin}"
)
depends=(
    'glibc>=2.38'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tgz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.tgz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tgz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-amd64.tgz")
sha256sums_aarch64=('6d0f142e9c33e472d00b89f0400a4cccbc80bf89a6126770e2d321698ef6e745')
sha256sums_x86_64=('e907f3887e9c1eb5ef7e21fb6360ae6a155acb4fb5623421e53ac4ed55a34468')
package() {
    install -Dm755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}
