#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=cyberfox-bin
pkgver=52.2.1
pkgrel=1
pn=cyberfox
pkgdesc="Fast and privacy oriented fork of Mozilla Firefox"
arch=('x86_64')
url="https://8pecxstudios.com/"
license=('GPL')
depends=('gtk2' 'libxt' 'dbus-glib' 'alsa-lib' 'hicolor-icon-theme' 'nss>=3.14.1' )
conflicts=('cyberfox')
source=("${pn}.desktop"
        "http://downloads.sourceforge.net/project/cyberfox/Zipped%20Format/Cyberfox-$pkgver.en-US.linux-${arch}.tar.bz2")

md5sums=('66568212abb7563bf390db5762924815'
         'b105399289572dd02a256b4015ddf55c')

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
    install -d "$pkgdir"/{usr/bin,opt}
    mv "${pn}" "${pkgdir}/opt/${pn}"
    ln -s "/opt/${pn}/${pn}" "${pkgdir}/usr/bin/${pn}"
    install -Dm644 "${pn}.desktop" "${pkgdir}/usr/share/applications/${pn}.desktop"
    install -Dm644 "${pkgdir}/opt/${pn}/browser/icons/mozicon128.png" \
                   "${pkgdir}/usr/share/pixmaps/${pn}-icon.png"
}
