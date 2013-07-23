# Maintainer: Christophe Robin <crobin@php.net>

pkgname=minecraft
pkgver=latest
pkgrel=20
pkgdesc="Minecraft is a game about placing blocks while running from skeletons. Or something like that..."
arch=(any)
license=('custom')
url="http://www.minecraft.net/"
depends=('java-runtime' 'xorg-server-utils' 'openal')
noextract=('minecraft.jar')
source=(minecraft http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
         minecraft.desktop minecraft.png minecraft.install LICENSE)
md5sums=('e528cb2b833cac204bdefd2a46687fe3'
         '85273e24404cc6865805f951487b8a1e'
         'dad9b69540dac246ced70b98f07e8e08'
         'b2c25797bf513a5ee215dd90b4b828e3'
         '30f8fd3deb598757bb21bac3c1c55110'
         'b82eddf7100b63e2fc52e53028327589')
install='minecraft.install'

package() {
    cd "$srcdir"

    install -D -m755 "${srcdir}/minecraft"         "${pkgdir}/usr/bin/minecraft"
    install -D -m644 "${srcdir}/Minecraft.jar"     "${pkgdir}/usr/share/minecraft/Minecraft.jar"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/minecraft.desktop" "${pkgdir}/usr/share/applications/minecraft.desktop"
    install -D -m644 "${srcdir}/minecraft.png"     "${pkgdir}/usr/share/pixmaps/minecraft.png"

    # License
    install -D -m644 "${srcdir}/LICENSE"           "${pkgdir}/usr/share/licenses/minecraft/LICENSE"
}

# vim:set ts=4 sw=4 et:
