# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.194
pkgrel=1
pkgdesc="A tool to manage and use Alibaba Cloud resources through a command line interface"
url="https://github.com/aliyun/aliyun-cli"
arch=(
    'aarch64'
    'x86_64'
)
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-cli-bin}"
    "${pkgname%-bin}"
)
depends=(
    'glibc>=2.38'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.tgz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-amd64.tgz")
sha256sums_aarch64=('3d859a1688cbde3a1f2dbb18e8f0c7861076b2a361b713d65ab4649657f7deed')
sha256sums_x86_64=('4eec23caaf34e374d2877d99cc8b263659194ddd7f5b513bcba8d45e56a0c691')
package() {
    install -Dm755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}