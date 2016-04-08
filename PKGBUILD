# Maintainer: zoe <chp321@gmail.com>

pkgname=synology-uploader-photos
_pkgname=SynologyAssistant
pkgver=3179
_sver=4.2
pkgrel=1
pkgdesc="uploader photos for Photo Station on NAS synology"
arch=('any')
url="http://www.synology.com"
license=('unknown')
depends=('bash')
conflicts=('synology-assistant' 'dsassistant')
install=${pkgname}.install

source=("https://global.download.synology.com/download/Tools/Assistant/${_sver}-${pkgver}/Linux/${_pkgname}-${_sver}-${pkgver}.tar.gz"
"${pkgname}.png"
"${pkgname}.desktop"
"${pkgname}.install")
md5sums=('37a69c5704b04b2d6990e97532745887'
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
