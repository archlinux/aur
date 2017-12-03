#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=cyberfox-bin
pkgver=52.5.1
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
         'CBFEDECB1866EC570DFF94ECB41F6F627B353E65A8F02ED3E393C47E309279202A7626459A71BD0CFEABF5FE7DE44C4C19C7933EB0FA3272AD41FE76DDE0335F')



package() {
    install -d "$pkgdir"/{usr/bin,opt}
    mv "${pn}" "${pkgdir}/opt/${pn}"
    ln -s "/opt/${pn}/${pn}" "${pkgdir}/usr/bin/${pn}"
    install -Dm644 "${pn}.desktop" "${pkgdir}/usr/share/applications/${pn}.desktop"
    install -Dm644 "${pkgdir}/opt/${pn}/browser/icons/mozicon128.png" \
                   "${pkgdir}/usr/share/pixmaps/${pn}-icon.png"
}
