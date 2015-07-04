# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=minecraft-launcher
pkgver=latest
pkgrel=4
pkgdesc="Launcher for Minecraft, a game about building with blocks in an infinite world."
arch=(any)
license=('custom')
url="http://www.minecraft.net/"
depends=('java-runtime' 'xorg-server-utils' 'openal')
conflicts=('minecraft')
source=(minecraft-launcher https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
         minecraft.desktop minecraft.png minecraft-launcher.install)
md5sums=('90cbd7a01441784bd0cdcb7c99a41265'
         '85273e24404cc6865805f951487b8a1e'
         'd43c7f36641f561d6506e06ba4782bd3'
         'b2c25797bf513a5ee215dd90b4b828e3'
         'a9cdf3f04808232fb6e9bb5c6d094815')
install='minecraft-launcher.install'

package() {
    cd "$srcdir" || return 1

    install -D -m755 "${srcdir}/minecraft-launcher"         "${pkgdir}/usr/bin/minecraft-launcher"
    install -D -m644 "${srcdir}/Minecraft.jar"     "${pkgdir}/usr/share/minecraft/minecraft.jar"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/minecraft.desktop" "${pkgdir}/usr/share/applications/minecraft.desktop"
    install -D -m644 "${srcdir}/minecraft.png"     "${pkgdir}/usr/share/pixmaps/minecraft.png"
}
