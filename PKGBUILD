# CO-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.0.189
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
sha256sums_aarch64=('86b5e7f1e08b63f89a598e3a8b8517f7581093dbe64b2ba306f9ee280cdc0664')
sha256sums_x86_64=('2058803f874772c0e63edbfda825000f2fe733cc290816f4e15783b14b28d110')
package() {
    install -Dm755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}