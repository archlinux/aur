# Maintainer: Jaan Toots <jaantoots@gmail.com>
# Contributor: Oliver Mader <b52@reaktor42.de>
pkgname=mitk-bin
pkgver=2018.04.2
pkgrel=1
pkgdesc='Medical Imaging Interaction Toolkit (MITK) is a free open-source software system for development of interactive medical image processing software.'
arch=('x86_64')
url='http://mitk.org'
license=('BSD')
provides=("${pkgname%-bin}")
depends=('libwrap' 'qt5-svg' 'qt5-tools' 'qt5-webengine')
source=("http://www.mitk.org/download/releases/MITK-2018.04.2/Linux/MITK-v2018.04.2-linux-x86_64.tar.gz"
        "LICENSE"
        "mitk-workbench"
        "mitk-workbench.desktop")
md5sums=('5286a826822eae465a50e7f9b301d45e'
         '7099df31ea5e0e2885aa2d12bff57e7f'
         'b273cb1fb77ce8d7a4c867a217d4422e'
         '225b216d2e924488f10e6927a820a299')

options=(!strip)

package() {
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/opt/${pkgname%-bin}-${pkgver}"
  cp -r "${srcdir}/MITK-v2018.04.2-linux-x86_64/bin" "${pkgdir}/opt/${pkgname%-bin}-${pkgver}/"
  install -Dm755 "${srcdir}/mitk-workbench" "${pkgdir}/usr/bin/mitk-workbench"
  install -Dm644 "${srcdir}/mitk-workbench.desktop" "${pkgdir}/usr/share/applications/mitk-workbench.desktop"
}
