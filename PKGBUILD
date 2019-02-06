# Maintainer: Jason Stryker <public at jasonstryker dot com>
# Contributor: Christophe Robin <crobin@nekoo.com>
pkgname=runelite-launcher
pkgver=1.6.1
pkgrel=2
pkgdesc="Open source Old School RuneScape client. (Launcher with auto-update)"
arch=(any)
license=('BSD')
url="https://runelite.net/"
depends=('java-runtime>=8' 'bash' 'ttf-font')
optdepends=('gvfs: enable links')
noextract=('runelite.jar')
source=("Runelite-${pkgver}.jar::https://github.com/runelite/launcher/releases/download/${pkgver}/RuneLite.jar"
        "https://raw.githubusercontent.com/runelite/launcher/${pkgver}/LICENSE"
        runelite-launcher        
        runelite-launcher.desktop
        runelite.png)
sha512sums=('8e58296f15020a46c21f40220841e92c5945d4a3f46b49c95831446cd82e2cd6671434c553f460ba78e553fa8d2ffca59142d70636d21160b4228fa0a898c0d9'
            'abf65fd1cf907dcc0a17c84335a38a8740c5ee992dc1c7fdba7e7755595e3136a87de52758a38d7b9f97ecbe39b778a6878c857406882198c0e1569389613086'
            'c1743cc010e8207ed6c2304e083b700281cffd97a952fcc67c538b2fd99750bba06f2c7776d19f433d26f4ece5ade5dcd4dd3f3d1a53a4ea1edfde3bec6eb4a5'
            'db548f7e675a1aabc8a97d40dc3f8f59f14fe55826e80faf95df1c957b6ae0cc40514998141a0e7fb5eb456a53a1fd298ea31cb97b6584487147ada7190668b7'
            'fe73d666eec61a8ac0059a56a417d3a22ccdc0d09eb567a613469af513318f4284ee70079a4d18d74cd3423c4d75ce5bb0a3c6df9f9f4532f8d5833ffe4a34ce')

package() {
    cd "$srcdir"

    install -D -m644 "${srcdir}/Runelite-${pkgver}.jar"     "${pkgdir}/usr/share/runelite-launcher/Launcher.jar"
    install -D -m755 "${srcdir}/runelite-launcher"          "${pkgdir}/usr/bin/runelite-launcher"
    install -D -m644 "${srcdir}/runelite-launcher.desktop"  "${pkgdir}/usr/share/applications/runelite-launcher.desktop"
    install -D -m644 "${srcdir}/runelite.png"               "${pkgdir}/usr/share/pixmaps/runelite-launcher.png"

    install -D -m644 "${srcdir}/LICENSE"                    "${pkgdir}/usr/share/licenses/${pkgname}"
}
