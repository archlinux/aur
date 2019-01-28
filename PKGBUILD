# Maintainer: Jesse Jaara <gmail.com: jesse.jaara> <vincit.fi: jesse.jaara>

pkgname=socket.io-tester
pkgver=1.2.3
pkgrel=1
pkgdesc="An app that allows one to connect to Socket.io server and send and receive messages for testing purposes."
arch=('x86_64')
url="http://appsaloon.github.io/socket.io-tester/"
license=('GPL2')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'libxss' 'libxtst' )
options=()
source=("Socket.io-tester.desktop"
        "https://github.com/AppSaloon/${pkgname}/raw/master/assets/logo.png")
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.zip::https://github.com/AppSaloon/socket.io-tester/releases/download/v${pkgver}/socket-io-tester-linux-x64.zip")
sha256sums=('4bcc6998d7601297bd59ce44a0c071f2e1e623d0123468b6761154e424c6e818'
            'ec15d9779dec4dc67ed35a41abf5fd8847ca8d5c34b17a4c2873e172772673ed')
sha256sums_x86_64=('a13dbf9c9fd5396f92b712fbb982be55987f19b33a44ba7eb4a6dcd11b5fccea')
noextract=("${pkgname}-${pkgver}-${CARCH}.zip")

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"

  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-${CARCH}.zip" --strip-components 1 --no-same-owner -C "${pkgdir}/opt/socket.io-tester"
  cp "${srcdir}/logo.png" "${pkgdir}/opt/socket.io-tester/"
  cp "${srcdir}/Socket.io-tester.desktop" "${pkgdir}/usr/share/applications/"
  ln -s "/opt/${pkgname}/socket-io-tester" "${pkgdir}/usr/bin/${pkgname}"
}
