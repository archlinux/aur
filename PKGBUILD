# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=iacs
pkgver=1.1.5.0.5492
pkgrel=1
pkgdesc="IBM i Access Client Solutions provides a Java based, platform-independent interface for IBM iAccess/iSeries (formerly known as AS400)."
arch=('any')
url="http://www.ibm.com/systems/power/software/i/access/solutions.html"
license=('custom')
depends=('java-runtime' 'gtk-update-icon-cache')
install="${pkgname}.install"
source=("https://dl.dropboxusercontent.com/u/99802211/External_Sources/IBM%20i%20Access%20Client%20Solutions/${pkgver}/IBMiAccess_v1r1.zip"
        "https://dl.dropboxusercontent.com/u/99802211/External_Sources/IBM%20i%20Access%20Client%20Solutions/${pkgver}/Readme.txt"
        "https://dl.dropboxusercontent.com/u/99802211/External_Sources/IBM%20i%20Access%20Client%20Solutions/${pkgver}/GettingStarted_en.html"
        "https://dl.dropboxusercontent.com/u/99802211/External_Sources/IBM%20i%20Access%20Client%20Solutions/${pkgver}/QuickStartGuide_en.html"
        "${pkgname}"
        "${pkgname}.desktop")
sha256sums=('abba132c0095886cfaa483714a8f6587365c6631b9cd7ec48efcd05dcc719e01'
            '3893d5f86f168e06e5aedaf3dc11d292ebf2ec0636e51c84081eebf2dfc41e99'
            'bc08998aa0908f0484edd1b968d014b8b25895b7be55e3c641cc1c537126b6dc'
            '66b4130afd6b6d24b3db6d7cce6e9dd301f9498522e1a42b5ed93eacf563ea2b'
            'ab45ad56ae32d11ad8372c5313db3cfe810551fe84cfa093a677ca423ad51ab2'
            '282ac5df2bd9db62e7684ea05ab249379b3cdc8776983d71a55956de85e79128')

package() {
  cd "${srcdir}"
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/GettingStarted_en.html"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/QuickStartGuide_en.html"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/Readme.txt"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" Documentation/*.txt
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" Documentation/*.html
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" Documentation/*.css
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" Documentation/Notices/*
  # Install license files
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" Documentation/License/*.txt
  ln -s  LA_en.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install application files
  install -m 755 -d "${pkgdir}/usr/share/java/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/java/${pkgname}" "acsbundle.jar"
  install -m 644 -t "${pkgdir}/usr/share/java/${pkgname}" "AcsConfig.properties"
  install -m 755 -d "${pkgdir}/usr/share/java/${pkgname}/Icons"
  install -m 644 -t "${pkgdir}/usr/share/java/${pkgname}/Icons" Icons/*
  # Install executable file
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}"
  # Install icons
  install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
  install -m 644 "Icons/logo32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -m 644 "Icons/logo128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
}

