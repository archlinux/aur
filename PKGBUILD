# Maintainer: Kevin Stephen <qarks@icloud.com>
# Maintainer: awsl1414 <awsl1414@qq.com>
pkgname=wechat-devtools-git
_pkgname=wechat-devtools
pkgver=1.06.2504060
pkgrel=3
epoch=0
pkgdesc="WeChat Devtools For Linux."
license=("MIT")
arch=("x86_64")
url="https://github.com/msojocs/wechat-web-devtools-linux"
provides=("${_pkgname}" "${_pkgname}-cli")
conflicts=("${_pkgname}-bin" "${_pkgname}")
depends=("libxkbfile")
options=("!strip")
source=(
    "WeChat_Dev_Tools_v${pkgver}-continuous-${pkgrel}.tar.gz::${url}/releases/download/continuous/WeChat_Dev_Tools_v${pkgver}-continuous_${arch}_linux.tar.gz"
    "${_pkgname}.desktop"
    "${_pkgname}.png"
    "${_pkgname}.sh"
    "${_pkgname}-cli.sh"
)
md5sums=('3d10511365f6d885aa01ad52dbc632c5'
         '08b27001217b9732289cd0e33f8f8d58'
         '9f585ae635005d2b6fa0570eb69cc12f'
         '6f3f6858627577e698c95d46e74e7e63'
         'dad3603be8e659c7e6667511d4889bb9')

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons"

    cp -r "${srcdir}/WeChat_Dev_Tools_v${pkgver}-continuous_${arch}_linux/"* "${pkgdir}/opt/${_pkgname}"
    # launcher
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${srcdir}/${_pkgname}-cli.sh" "${pkgdir}/usr/bin/${_pkgname}-cli"
    # desktop file
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # icons
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
}
