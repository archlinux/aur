# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=illarion-bin
_pkgname=illarion
pkgver=1.0.0.43
pkgrel=2
pkgdesc='The Illarion Launcher that is used to download the actual game
 and start it'
arch=('x86_64')
url='https://illarion.org'
license=('GPL')
provides=('illarion')
options=('!strip')
source=("https://${_pkgname}.org/media/java/install/${_pkgname}-${pkgver}-amd64.deb"
        "${_pkgname}.desktop")
sha512sums=('d0bb3b47ad1358209f00b3788ca29292388dc4db33e94c30681c54657182e988ff88dd39f55f15a4ec1f7afa428e94e962c50ac51a77be762d3355e8fdfd2027'
            'a2ef2ca5acbd5ee82f617e863411d43e4e1f4815e7ae197c9b7a27375c0069ed9f096318bfb8ea71b731b09f19a2d46b6ca1417b9e12f03b5b2640f7de529443')

package() {
    tar -xf "${srcdir}/data.tar.bz2" -C "${pkgdir}"

    cd "${pkgdir}"
    install -dm755 "usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/.install4j/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
