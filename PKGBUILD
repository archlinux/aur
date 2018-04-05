# Maintainer: zoe <chp321@gmail.com>

pkgname=synology-uploader-photos
_pkgname=SynologyAssistant
pkgver=5.0.4418
_pkgver=4418
_sver=5.0
pkgrel=2
pkgdesc="uploader photos for Photo Station on NAS synology"
arch=('x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('bash')
conflicts=('synology-assistant' 'dsassistant')
install=${pkgname}.install

source=("https://global.download.synology.com/download/Tools/Assistant/${_sver}-${_pkgver}/Linux/${_pkgname}-${_sver}-${_pkgver}.tar.gz"
"${pkgname}.png"
"${pkgname}.desktop"
"${pkgname}.install")
md5sums=('c58e75f2edd3fb42a26f6d420bd48d3b'
         '7835bb6e6df770ddf912a7ea542e95f8'
         'cb34d433bd0d83aa5fc9ad62564eb421'
         '52d611aed4d4558a57846415a1e90de0')

package() {
    mkdir -p "${pkgdir}/opt/Synology"
    cp -rp SynologyAssistant "${pkgdir}/opt/Synology/${pkgname}"

    
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/Synology/${pkgname}/SynologyAssistant "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 ${pkgname}.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
}
