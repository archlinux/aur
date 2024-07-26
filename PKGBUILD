# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.215
pkgrel=1
pkgdesc="A tool to manage and use Alibaba Cloud resources through a command line interface."
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
sha256sums_aarch64=('604abddd07152ec9970edf3d686417bc1882553ec4aae815d749d23a6f375dbc')
sha256sums_x86_64=('94665dd3d20234d5139a20f48bd14a1bbfcea57feca01ec34f9ab22fc6df9081')
package() {
    install -Dm755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}