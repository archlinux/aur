#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=cyberfox-bin
pkgver=52.5.2
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

sha512sums=('SKIP'
         'A34F5CDD2AED9E17CA846030592FA4FA8401A8C5162EED7584985BF241773FA2B3E1FD6470FF3E0F25E3E69D5D3492B9841E12734499DE0ACB481B829DC40ACE')



package() {
    install -d "$pkgdir"/{usr/bin,opt}
    mv "${pn}" "${pkgdir}/opt/${pn}"
    ln -s "/opt/${pn}/${pn}" "${pkgdir}/usr/bin/${pn}"
    install -Dm644 "${pn}.desktop" "${pkgdir}/usr/share/applications/${pn}.desktop"
    install -Dm644 "${pkgdir}/opt/${pn}/browser/icons/mozicon128.png" \
                   "${pkgdir}/usr/share/pixmaps/${pn}-icon.png"
}
