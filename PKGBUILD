# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.238
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
sha256sums_aarch64=('53320a4d75873f8cfc1fd812d2955ade95a6b74c9dfb83ca7c2a527c2e286b4c')
sha256sums_x86_64=('8fa498d59a2dcdab85c292b319c56fefc8ece72a5177ef9101c1f9daafc1f2da')
package() {
    install -Dm755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}
