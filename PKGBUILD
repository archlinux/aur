# Maintainer: Xewl - Ken Verhaegen <xewl@live.com>
# Maintainer: ItachiSan <giovannisantini93(AT)yahoo.it>
# Credits to AnjoCaido0, Sparamoule and KeiNett for the launcher file.

pkgname=minecraftsp-anjocaido
epoch=1
pkgver=autoupdate
pkgrel=6
pkgdesc="Minecraft is a sandbox game which allows players to build constructions out of textured cubes in a 3D world."
arch=(any)
license=('unknown')
url="http://www.mcalpha.tk/"
depends=('java-runtime' 'xorg-xrandr' 'openal')
provides=('minecraft')
replaces=('minecraft')
source=('minecraft'
        'https://github.com/ItachiSan/linux_packaging/raw/master/aur-files/minecraftsp-anjocaido/MinecraftSP.jar'
        'minecraft.desktop'
        'minecraft.png'
        'readme.txt')
md5sums=('be3369716936dab9c441d4eaddbde7a2'
         '2570c1a007ed61e7ce5eb0f062c5d0ef'
         'dad9b69540dac246ced70b98f07e8e08'
         'b2c25797bf513a5ee215dd90b4b828e3'
         '7119963de1fc2ff67f5d576f44559dc0')
install=minecraft.install

package() {
    cd "$srcdir" || return 1

    mkdir -p $pkgdir/usr/bin
    cp minecraft $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/minecraft
    cp MinecraftSP.jar $pkgdir/usr/share/minecraft

    # Desktop launcher with icon
    install -Dm644 $srcdir/minecraft.desktop $pkgdir/usr/share/applications/minecraft.desktop
    install -Dm644 $srcdir/minecraft.png     $pkgdir/usr/share/pixmaps/minecraft.png

    # Readme
    install -Dm644 $srcdir/readme.txt        $pkgdir/usr/share/minecraft/readme.txt
}
