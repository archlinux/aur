# Maintainer: Adrian Lopez <adrianlzt@gmail.com>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=droidmote
pkgver=3.0.0
pkgrel=2
pkgdesc='Server for DroidMote. Use your androd as remote mouse and keyboard.'
arch=('i686' 'x86_64')
url='http://www.videomap.it/'
license=('custom:unknown')
depends=('libx11')
backup=("etc/${pkgname}.conf")
source=("${pkgname}.conf"
        "service")
source_i686=("${pkgname}-x32-${pkgver}.tar::https://drive.google.com/uc?export=download&id=0B-EA_LjgyxcHRmFaZ0FKT3dpWFU")
source_x86_64=("${pkgname}-x64-${pkgver}.tar::https://drive.google.com/uc?export=download&id=0B-EA_LjgyxcHOWhjejVfMzRsb0E")
sha256sums=('b6386dec0977b27dff244e04f4fdbf5becc4c12731a261678524c21ffb3e53a4'
            '0e88c9e0b189e0d8890ddbee8f00da13485973e028811e4e70a8b1c2b7595bbe')
sha256sums_i686=('9f92ca81b6e7cd2fb24588b1d1ecb68790c760ae5f576e91222aecf0e484d6df')
sha256sums_x86_64=('57ec9ed9eebe1c60869194259fa98938c6a2efc2756776b7fa0461028627a734')

package() {
  install -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
  install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
