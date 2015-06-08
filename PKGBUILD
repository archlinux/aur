# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

pkgname=skcraft-launcher
pkgver=latest
pkgrel=1
pkgdesc="SKCraft Launcher - An open-source Minecraft launcher for downloading, installing, and updating modpacks."
arch=(any)
license=('LGPL3')
url="http://skcraft.com"
depends=('java-runtime' 'xorg-server-utils' 'openal')
noextract=('SKCraftLauncher.jar')

source=('skcraft' 'SKCraftLauncher.desktop' 'icon.png' 'http://update.skcraft.com/quark/bootstrap/SKCraftLauncher.jar')
md5sums=('48becf69586e867503f9414d4503d276'
         'd46eeeae116c5e9d714f2687a0ae4d9d'
         '1dc93765fe1957e1b0c5fdd4f2db065a'
         'b1848840913fca77e7a480037f57ae4c')

package() {
    cd "$srcdir"
    
    install -D -m755 "${srcdir}/skcraft"         "${pkgdir}/usr/bin/skcraft"
    install -D -m644 "${srcdir}/SKCraftLauncher.jar"     "${pkgdir}/usr/share/minecraft/SKCraftLauncher.jar"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/SKCraftLauncher.desktop" "${pkgdir}/usr/share/applications/SKCraftLauncher.desktop"
    install -D -m644 "${srcdir}/icon.png"     "${pkgdir}/usr/share/pixmaps/SKCraftLauncher.png"
}

# vim:set ts=4 sw=4 et:
