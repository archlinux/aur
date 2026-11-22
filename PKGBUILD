# Maintainer: ORION MELAENO <midway64@proton.me>
# Contributor: ORION MELAENO <midway64@proton.me>

pkgbase=freedoom-bin
pkgname=(freedoom-bin freedm-bin)
_pkgnamesp=freedoom
_pkgnamemp=freedm
pkgver=0.13.0
pkgrel=1
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD-3-Clause')
source=("https://github.com/freedoom/freedoom/releases/download/v${pkgver}/freedm-${pkgver}.zip"
        "https://github.com/freedoom/freedoom/releases/download/v${pkgver}/freedoom-${pkgver}.zip")
sha256sums=('b420f13508ef745d7b38e83d15e55e0fc0b09d9a503c96741cddd9773d43f7c9'
            '3f9b264f3e3ce503b4fb7f6bdcb1f419d93c7b546f4df3e874dd878db9688f59')

package_freedm-bin() {
    pkgdesc="Fight friends and enemies in competitive deathmatch"
    conflicts=('freedm')
    provides=('freedm')
    install -Dm644 ${_pkgnamemp}-${pkgver}/*.wad -t "${pkgdir}/usr/share/games/doom"
    install -Dm644 ${_pkgnamemp}-${pkgver}/*.html freedm-${pkgver}/*.pdf  -t "${pkgdir}/usr/share/doc/${_pkgnamemp}"
    install -Dm644 ${_pkgnamemp}-${pkgver}/COPYING.txt "${pkgdir}/usr/share/licenses/${_pkgnamemp}/COPYING"
    install -Dm644 ${_pkgnamemp}-${pkgver}/CREDITS.txt "${pkgdir}/usr/share/licenses/${_pkgnamemp}/CREDITS"
    install -Dm644 ${_pkgnamemp}-${pkgver}/CREDITS-MUSIC.txt "${pkgdir}/usr/share/licenses/${_pkgnamemp}/CREDITS-MUSIC"
    ln -rs ${pkgdir}/usr/share/licenses/${_pkgnamemp} ${pkgdir}/usr/share/licenses/${_pkgnamemp}-bin
}

package_freedoom-bin() {
    pkgdesc="Battle monsters in two massive campaigns"
    conflicts=('freedoom1' 'freedoom2')
    provides=('freedoom1' 'freedoom2')
    install -Dm644 ${_pkgnamesp}-${pkgver}/*.wad -t "${pkgdir}/usr/share/games/doom"
    install -Dm644 ${_pkgnamesp}-${pkgver}/*.html freedm-${pkgver}/*.pdf  -t "${pkgdir}/usr/share/doc/${_pkgnamesp}"
    install -Dm644 ${_pkgnamesp}-${pkgver}/COPYING.txt "${pkgdir}/usr/share/licenses/${_pkgnamesp}/COPYING"
    install -Dm644 ${_pkgnamesp}-${pkgver}/CREDITS.txt "${pkgdir}/usr/share/licenses/${_pkgnamesp}/CREDITS"
    install -Dm644 ${_pkgnamesp}-${pkgver}/CREDITS-MUSIC.txt "${pkgdir}/usr/share/licenses/${_pkgnamesp}/CREDITS-MUSIC"
    ln -rs ${pkgdir}/usr/share/licenses/${_pkgnamesp} ${pkgdir}/usr/share/licenses/${_pkgnamesp}-bin
}
