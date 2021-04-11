# Maintainer: Pan Li <lipan19@mails.jlu.edu.cn>

pkgname=mitk
pkgver=2021.02
pkgrel=1
pkgdesc="Medical Imaging Interaction Toolkit (MITK) is a free open-source software system for development of interactive medical image processing software."
arch=('x86_64')
url="https://mitk.org"
license=('BSD')
depends=('libwrap' 'qt5-svg' 'qt5-tools' 'qt5-webengine')
source=("https://www.mitk.org/download/releases/MITK-2021.02/Ubuntu%2020.04/MITK-v2021.02-linux-x86_64.tar.gz"
        "LICENSE"
        "mitk-workbench"
        "mitk-workbench.desktop")
md5sums=('8c39aece3a4226b950dc18fcdcbfb2b9'
                        'e559d78ebaf8764cbef89a26d3fcbfe6'
                        'c660294bae6faf808acf0c659d64f372'
                        '96fab1bb6f6eea48c3a1bf8f525635ba')

options=(!strip)

package() {
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/opt/${pkgname}-${pkgver}"
  cp -r "${srcdir}/MITK-v${pkgver}-linux-${arch}/bin" "${pkgdir}/opt/${pkgname}-${pkgver}/"
  install -d "${pkgdir}/usr/share/pixmaps/"
  cp -r "${srcdir}/MITK-v${pkgver}-linux-${arch}/bin/mitk.ico" "${pkgdir}/usr/share/pixmaps/"
  install -Dm755 "${srcdir}/mitk-workbench" "${pkgdir}/usr/bin/mitk-workbench"
  install -Dm644 "${srcdir}/mitk-workbench.desktop" "${pkgdir}/usr/share/applications/mitk-workbench.desktop"
}
