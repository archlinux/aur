# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
pkgname=lugaru
pkgver=1.0c
pkgrel=3
pkgdesc="A third-persion action game featuring a unique close-range combat system"
url="http://www.wolfire.com/lugaru"
license=('custom')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'openal' 'sdl')
source=("${pkgname}-${pkgver}.zip::http://cdn.wolfire.com/games/${pkgname}/${pkgname}-linux-x86-${pkgver}.bin"
        "${pkgname}.launcher"
        "${pkgname}.desktop")
sha256sums=('ad330c9f5496a1fc54fb3640723420a80dfee9da47a71ef7a34a38848c885ade'
            'c8a8bb5be74806f7c7aeef5839a7de549dbabb95edd4394063d7ad6572d88e04'
            '306df52e81c544ed8884f52d4c6392c9d0de8d82ea3c68a53d7d3d924d1780d9')

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a --no-preserve=ownership data/* "${pkgdir}/opt/${pkgname}"

    install -Dm755 "${srcdir}/${pkgname}.launcher" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "data/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
