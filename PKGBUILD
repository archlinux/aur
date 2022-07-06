# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron
_pkgname=qqmusic
pkgver=1.1.4
pkgrel=2
pkgdesc="Tencent QQMusic, Run with system Electron."
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('electron13')
makedepends=('asar')
provides=("$_pkgname")
conflicts=('qqmusic-bin')
source=(
    "qqmusic_${pkgver}-${pkgrel}.asar::https://files.catbox.moe/a5niyr.asar"
    "${_pkgname}.desktop"
    "${_pkgname}".sh
)
sha512sums=('1c163eb75878f3fa5188f9386f033319b8c06bda9f9d0af45e166f839d322e7e2bcdaf5a50992f3a1c0c298bc79b4b193c1c5acd3057203bd53bcb2d75af1f7a'
            '4420cb722670e5e1985c58326824d56ebdd030bf5f9c2e685f3cab2419672420d2c9529b374f081e52200dc85a07170f0c2a0f75ffa248ee13e49f9ec2deb97f'
            'e15125f812c7d0b1ba0ecce090e8ac3543423f224a2b13b09e27c5ff0b9083ae13769792a962edfb0a706332cc26c4e196e63b2a14e9fe74cfdea5c3ce61c706')

prepare() {
    cd "${srcdir}"
    asar ef qqmusic_${pkgver}-${pkgrel}.asar logo.png
}

package(){
    cd "${srcdir}"
    
    install -Dm755 ${_pkgname}.sh "${pkgdir}/usr/bin/qqmusic"
    install -Dm644 qqmusic_${pkgver}-${pkgrel}.asar "${pkgdir}/usr/lib/qqmusic/app.asar"
    install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/qqmusic.desktop"
    install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/qqmusic.png"
}
 
