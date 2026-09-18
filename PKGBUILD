# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Trevor Facer <trevordf@protonmail.com>
pkgname=aliyun-cli-bin
pkgver=3.5.1
pkgrel=1
pkgdesc=' A cross-platform command-line tool for managing Alibaba Cloud resources through OpenAPI.'
url="https://help.aliyun.com/zh/cli/"
_ghurl="https://github.com/aliyun/aliyun-cli"
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tgz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.tgz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tgz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-amd64.tgz")
sha256sums_aarch64=('6973475472496a840de140b7997b6f11616e842b82737e2851acd6dda4c5c0c6')
sha256sums_x86_64=('3a9a45b9c7899228074135612d2b7ebbf32abb97826d825787cb454cd3011bdc')
package() {
    install -Dm755 "${srcdir}/${pkgname%-cli-bin}" -t "${pkgdir}/usr/bin"
}
