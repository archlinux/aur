# Maintainer: Christophe Robin <crobin@php.net>

pkgname=minecraft
pkgver=latest
pkgrel=23
pkgdesc="An open-world game whose gameplay revolves around breaking and placing blocks"
arch=(any)
license=('custom')
url="http://www.minecraft.net/"
depends=('java-runtime' 'xorg-xrandr' 'ttf-dejavu')
noextract=('minecraft.jar')
source=(minecraft http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
         minecraft.desktop minecraft.png minecraft.install LICENSE)
md5sums=('9652c0548bc2aec58039588fcec1e4e4'
         '85273e24404cc6865805f951487b8a1e'
         'dad9b69540dac246ced70b98f07e8e08'
         'dfecf76f9db4497399f4b7c171150c89'
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
