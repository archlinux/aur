#Maintainer: Plague-doctor <plague at privacyrequired dot com >

PN=Cyberfox
pkgname=cyberfox
pkgver=51.0.3
pkgrel=1
pkgdesc="Fast and privacy oriented fork of Mozilla Firefox"
arch=('x86_64')
url="https://8pecxstudios.com/"
license=('GPL')
depends=('gtk2' 'libxt' 'dbus-glib' 'alsa-lib' 'hicolor-icon-theme' 'nss>=3.14.1' )
source=("${pkgname}.desktop"
        "http://downloads.sourceforge.net/project/cyberfox/Zipped%20Format/${PN}-$pkgver.en-US.linux-${arch}.tar.bz2")

md5sums=('66568212abb7563bf390db5762924815'
         '07b14d8b43bcdd007da8a0f4dc4964a4')

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
    install -d "$pkgdir"/{usr/bin,opt}
    mv "${PN}" "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/${PN}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/browser/icons/mozicon128.png" \
                   "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
}
