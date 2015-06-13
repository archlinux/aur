# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=iacs
pkgver=1.1.4.5161
pkgrel=1
pkgdesc="IBM i Access Client Solutions provides a Java based, platform-independent interface for IBM iAccess/iSeries (formerly known as AS400)."
arch=('any')
url="http://www.ibm.com/systems/power/software/i/access/solutions.html"
license=('custom')
depends=('java-runtime' 'gtk-update-icon-cache')
install="${pkgname}.install"
source=("ftp://ftp.software.ibm.com/as400/products/clientaccess/solutions/updates/IBMiAccess_v1r1m4_Update1.zip"
        "ftp://ftp.software.ibm.com/as400/products/clientaccess/solutions/updates/Readme.txt"
        "ftp://ftp.software.ibm.com/as400/products/clientaccess/solutions/GettingStarted_en.html"
        "${pkgname}"
        "${pkgname}.desktop")
sha256sums=('50879a348c4a7cf785b025a8b29a7cfd59da37f63e19c7bb7bea8f0564a3629f'
            '00d05d6cf50e08e030710e0e219d09ce941b0168a4a424ee2bb9ff742344db7b'
            '60a55eb0929b63f9be28fdb813c1e76dac04c8a77a11b769a07138d568894108'
            'ab45ad56ae32d11ad8372c5313db3cfe810551fe84cfa093a677ca423ad51ab2'
            '282ac5df2bd9db62e7684ea05ab249379b3cdc8776983d71a55956de85e79128')

package() {
  cd "${srcdir}"
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/GettingStarted_en.html"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/Readme.txt"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" Documentation/*
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" Notices/*
  # Install license files
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" License/*.txt
  ln -s  LA_en.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install application files
  install -m 755 -d "${pkgdir}/usr/share/java/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/java/${pkgname}" "acsbundle.jar"
  install -m 644 -t "${pkgdir}/usr/share/java/${pkgname}" "AcsConfig.properties"
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

