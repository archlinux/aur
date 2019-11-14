# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=iacs
pkgver=1.1.8.2.9170
pkgrel=1
pkgdesc="IBM i Access Client Solutions provides a Java based, platform-independent interface for IBM iAccess/iSeries (formerly known as AS400)."
arch=('any')
url="http://www.ibm.com/systems/power/software/i/access/solutions.html"
license=('custom')
depends=('java-runtime' 'gtk-update-icon-cache')
source=("https://url.muflone.com/iacs-${pkgver}.zip"
        "https://url.muflone.com/iacs_readme-${pkgver}.txt"
        "https://url.muflone.com/iacs_getting_started-${pkgver}.html"
        "https://url.muflone.com/iacs_quickstart_guide-${pkgver}.html"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('2cb94eccc55835bd10ba51e64288fcfa8c8c83c947a56b40b5d5e8b6fef8bcf1'
            'ee1809764aae73617aa3357c97ba3e0a138071c8de0ed2a108232225c30dc948'
            '07be73f767196ef306636384306d9ba0044630ade6a8e5c60ce6eb68be620b0b'
            'e9268ffbefc7bcf019c108a9902fa3b9a2006e11481f4327e7ddf7f376f23b31'
            'ab45ad56ae32d11ad8372c5313db3cfe810551fe84cfa093a677ca423ad51ab2'
            '282ac5df2bd9db62e7684ea05ab249379b3cdc8776983d71a55956de85e79128')

package() {
  cd "${srcdir}"
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 "${srcdir}/iacs_getting_started-${pkgver}.html" "${pkgdir}/usr/share/doc/${pkgname}/GettingStarted.html"
  install -m 644 "${srcdir}/iacs_quickstart_guide-${pkgver}.html" "${pkgdir}/usr/share/doc/${pkgname}/QuickStartGuide.html"
  install -m 644 "${srcdir}/iacs_readme-${pkgver}.txt" "${pkgdir}/usr/share/doc/${pkgname}/Readme.txt"
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
  install -m 755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # Install icons
  install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
  install -m 644 "Icons/logo32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -m 644 "Icons/logo128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
}

