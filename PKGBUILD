# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=datazenit
pkgver=1.1.0
pkgrel=1
pkgdesc="Cross-platform MySQL and PostgreSQL GUI (14-day trial)"
arch=('i686' 'x86_64')
url="https://datazenit.com/"
license=('proprietary')
depends=('gtk2' 'libnotify' 'libxtst' 'alsa-lib' 'fontconfig' 'cairo' 'gconf' 'nss')
source_x86_64=(${pkgname}-x64-${pkgver}.zip::https://datazenit.com/store/download/desktop/linux64
        ${pkgname}.desktop)
source_i686=(${pkgname}-ia32-${pkgver}.zip::https://datazenit.com/store/download/desktop/linux32
        ${pkgname}.desktop)
md5sums_i686=('a6054e4d049efb896711d3e0f651c722'
              '0750a3c2e7557bbd86790e3c220162d4')
md5sums_x86_64=('1245540d5ea8bc35a5555a47d82a6615'
                '0750a3c2e7557bbd86790e3c220162d4')
package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"

    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"

    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -m644 "${srcdir}/${_pkg}/resources/app/${pkgname}-icon@2x.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
    install -m644 "${srcdir}/${_pkg}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    rm -f ${pkgname}-*.zip ${pkgname}.desktop
    mv "${srcdir}"/* "${pkgdir}"/opt/${pkgname}/
    ln -s /opt/${pkgname}/Datazenit "${pkgdir}"/usr/bin/${pkgname}
}
