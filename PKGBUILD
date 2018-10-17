#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=cyberfox-bin
pkgver=52.9.1
pkgrel=1
_pkgname=${pkgname/-bin}
pkgdesc="Fast and privacy oriented fork of Mozilla Firefox"
arch=('x86_64')
url="https://8pecxstudios.com/"
license=('GPL')
depends=('gtk2' 'libxt' 'dbus-glib' 'alsa-lib' 'hicolor-icon-theme' 'nss>=3.14.1' )
conflicts=('cyberfox')
source=("$_pkgname.desktop"
        "http://downloads.sourceforge.net/project/$_pkgname/Zipped%20Format/${_pkgname^}-$pkgver.en-US.linux-${arch}.tar.bz2")

sha512sums=('7230ee3130a8a6e29b56b437ac61de1ffb7d91ba487748926d910cb5cd58d924b5b6ad6583f86edb553a870b64d66f6b6af39a2449175a5ae7d267f70c71038a'
            '8781348cc42c2a2c47bf844f556b736551c017f30ef7df636ffdd812fa9ad9b15e939f6659aa48b58c8ec5998622c7f1694ed471b3ed5aab19cf35f9bf3a0344')

package() {
    install -d "$pkgdir"/{usr/bin,opt}
    mv "${_pkgname}" "${pkgdir}/opt/${_pkgname}"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/browser/icons/mozicon128.png" \
                   "${pkgdir}/usr/share/pixmaps/${_pkgname}-icon.png"
}
