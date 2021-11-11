# Maintainer: -=De/\/=-
pkgname=rusted-ruins
pkgver=0.11.0
pkgrel=1
pkgdesc="Extensible open world rogue like game with pixel art"
arch=('x86_64')
url='https://github.com/garkimasera/rusted-ruins'
license=('GPLv3')

depends=('sdl2' 'sdl2_mixer' 'sdl2_image' 'sdl2_ttf')

source=('https://github.com/garkimasera/rusted-ruins/releases/download/v0.11.0/rusted-ruins_0.11.0_amd64.deb'
        'rusted-ruins.png'
        'rusted-ruins.desktop')
noextract=("${pkgname}_${pkgver}_amd64.deb")

package() {
    bsdtar -O -xf "rusted-ruins_${pkgver}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    
    cd ${srcdir}
    install -D -m644 rusted-ruins.png ${pkgdir}/usr/share/pixmaps/rusted-ruins.png
    install -D -m644 rusted-ruins.desktop ${pkgdir}/usr/share/applications/rusted-ruins.desktop
}

sha256sums=('b73308a6789cb5805d9750385063c02501fff25849c532c4ce512ce470205337'
            'd60170498c3831f0c4ff27073379ebcde7eebe6b92228d11d7e7a77b847bb485'
            '5c310411b8d1a23747c37f5f3c4f56e9734ba809382dec1b05033defa45dd622')
