# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudpan189-go-bin
pkgver=0.1.3
pkgrel=2
pkgdesc="Cloud 189 Command Line Client (CLI), implemented based on GO.天翼云盘命令行客户端(CLI),基于GO语言实现"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://github.com/tickstep/cloudpan189-go"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-go-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-armv7.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-amd64.zip")
sha256sums_aarch64=('ec8729093a82092b35a68a022d548f76d40a61e6ab490f1bef9842abb8134ef7')
sha256sums_armv7h=('ba8ac3a31c61c6fb81a88e7d90167427af5d5850fb551e8422ec182c5cabb70c')
sha256sums_i686=('f5cdf2195dc07f20cb09f716d8f916c04ee12512c2a7fe9a81d3300813a5b472')
sha256sums_x86_64=('08415a7ab7df6d222d37c3599047a12d96abafeaa60167c4eef74fd59fceeea9')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-"*/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}-"*/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}