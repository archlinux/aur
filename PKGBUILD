# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudpan189-go
pkgver=0.1.3
pkgrel=3
pkgdesc="Cloud 189 Command Line Client (CLI), implemented based on GO.天翼云盘命令行客户端(CLI),基于GO语言实现"
arch=('x86_64')
url="https://github.com/tickstep/cloudpan189-go"
license=('Apache')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.zip")
sha256sums=('08415a7ab7df6d222d37c3599047a12d96abafeaa60167c4eef74fd59fceeea9')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-linux-amd64/${pkgname}" -t "${pkgdir}/opt/${pkgname}/"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}