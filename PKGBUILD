# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudpan189-go
pkgver=0.1.2
pkgrel=1
pkgdesc="Cloud 189 Command Line Client (CLI), implemented based on GO.天翼云盘命令行客户端(CLI),基于GO语言实现"
arch=('x86_64')
url="https://github.com/tickstep/cloudpan189-go"
license=(custom:apache2)
depends=()
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.zip"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('3f81dd311676c9661589626b54c08f2dba6891e219a86a06071d234154d9a216'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-linux-amd64/${pkgname}" -t "${pkgdir}/opt/${pkgname}/"
    install -Dm755 -d "${pkgdir}/usr/bin/"
    ln -sf "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}