# Maintainer: xmengnet <my [AT] liyp.cc>
# Maintainer: xfangfang <xfangfang [AT] 126.com>
_pkgname=macast
pkgname=${_pkgname}-bin
pkgver=0.7
pkgrel=3
pkgdesc="DLNA Media Renderer"
arch=("x86_64")
conflicts=('macast')
provides=('macast')
url="https://github.com/xfangfang/Macast"
license=('GPL3')
depends=('python'
         'libxcrypt-compat'
         'mpv')


source=(
    "${_pkgname}::https://github.com/xfangfang/Macast/releases/download/v${pkgver}/Macast-Linux-v${pkgver}-amd64"
    "icon.png::https://github.com/xfangfang/Macast/raw/main/macast/assets/icon.png"
    "${_pkgname}.desktop"
)
sha256sums=('fa3f5101e9c2c8b5aad33ea3ebcbddd4c9a605fca024357197ae1c9398c72661'
            'c0736b51b9bb98859b83be68e246d60616f7f745b1a2254e2020b267852f4086'
            'a246d1ed58ece390f50a888d342ba1c8933a63bdd838c4199b3efdd40422aa0d')

package(){
    cd ${srcdir}
    install -d "${pkgdir}/usr/share/icons"
    install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/Macast.png"
    install -d "${pkgdir}"/usr/bin
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}"/usr/bin
    install -d $pkgdir/usr/share/applications/
    cd $pkgdir/usr/share/applications/
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
 
