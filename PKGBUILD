# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron
_pkgname=qqmusic
pkgver=1.1.5
pkgrel=5
pkgdesc="Tencent QQMusic, Run with system Electron."
arch=('any')
url="https://y.qq.com/"
license=('CC0-1.0')
depends=('electron20')
makedepends=('asar')
provides=("$_pkgname")
conflicts=('qqmusic-bin')
source=(
    "https://test.mini-proxy.mivm.cn/qqmusic-electron/qqmusic_${pkgver}-${pkgrel}.asar"
    "${_pkgname}.desktop"
    "${_pkgname}.sh"
)
sha512sums=('7be385d18fa674f31332b8ac68a94b5d5eeeb76365fd51d310f743c57ea912f7403ccb02a4c8276b77edcceea35e7afc632f635a6b90e8e97bc439a97ed78d8c'
            'a872d410a02700b66ae9c55ee10a59bc6831caf403f3e62a96b7baa3ea39a8d239a1b829d2b13db4947b97daa9b9eb588deeea05ed125a6ac6892f43d6aa300f'
            'faace41c1098cdc39a6137ccb28417968eb6667bf95e81be32b4f97fde492c311674def2e3f2ae16fff4d79beb7b2eb42c0109f590362a50d023b036e48e9c2e')

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
 
