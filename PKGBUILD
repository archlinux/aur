# Maintainer: badcast <lmecomposer@gmail.com>
# Contributor: Artem Izmaylov <support@aimp.ru>
_pkver=(5.40 2696)
pkgname=aimp
pkgver=${_pkver[0]}.${_pkver[1]}
pkgrel=1
url="https://www.aimp.ru"
pkgdesc="AIMP (on Wine) is powerful free audio player."
arch=('x86_64')
license=('custom')
depends=('wine' 'sh' 'hicolor-icon-theme')
source=("${url}/files/linux/aimp_${_pkver[0]}-${_pkver[1]}_amd64.deb"
        "${pkgname}"
        "${pkgname}ac"
        "${pkgname}ate"
        "AIMP.exe.desktop"
        "${pkgname}ac.desktop"
        "${pkgname}ate.desktop")
sha256sums=('701620f5c84806c21ab9fd048e7903d3014b4d8cfc391dceb5696da10b12895f'
            '4c9a93d452cbdc68edaa7599432a501fc3a07aa3a97caf7f7440918283105c25'
            '5ddae7098e215717b7243839686c9c07b6213a9f97fd3c28de5071a48e6942b6'
            '735954b1a61249e2e1ab2ca052330e39ee846e27a89eefb0193cac7ed8f4bebc'
            '0e50842c16e53192f92d6d1b2b1fae64639283047a00f659c2f95274e54a5169'
            '638dac1fb0f8271c80789d64eb2a24820d2d2fadadb4fa98f97e8728c2810955'
            '310706f4ee0955956a3b660c86f88ee43e59f06bb1bacd039ab43d017c3a3615')

package(){
   bsdtar -xf "data.tar.gz" -C "${pkgdir}"
   install -Dm644 "${srcdir}/AIMP.exe.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/${pkgname}ac.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/${pkgname}ate.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${pkgdir}/opt/${pkgname}/AIMP/Assets/logo.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
   install -Dm644 "${pkgdir}/opt/${pkgname}/AIMP/Assets/ac70x70Logo.png" "${pkgdir}/usr/share/icons/hicolor/72x72/apps/${pkgname}ac.png"
   install -Dm644 "${pkgdir}/opt/${pkgname}/AIMP/Assets/ate70x70Logo.png" "${pkgdir}/usr/share/icons/hicolor/72x72/apps/${pkgname}ate.png"
   install -Dm644 "${pkgdir}/opt/${pkgname}/AIMP/license.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rtf"
   find "${pkgdir}" -type d -exec chmod 755 {} \;
   find "${pkgdir}" -type f -exec chmod 644 {} \;
   install -Dm755 "${srcdir}/${pkgname}" -t "${pkgdir}/usr/bin"
   install -Dm755 "${srcdir}/${pkgname}ac" -t "${pkgdir}/usr/bin"
   install -Dm755 "${srcdir}/${pkgname}ate" -t "${pkgdir}/usr/bin"
}

