# Maintainer: Xewl - Ken Verhaegen <xewl@live.com>
# Maintainer: ItachiSan <giovannisantini93(AT)yahoo.it>
# Credits to AnjoCaido0, Sparamoule and KeiNett for the launcher file.

pkgname=minecraftsp-anjocaido
epoch=1
pkgver=autoupdate
pkgrel=7
pkgdesc="Minecraft is a sandbox game which allows players to build constructions out of textured cubes in a 3D world."
arch=(any)
license=('unknown')
url="https://teamshiginima.com/update/"
depends=('java-runtime>=8' 'xorg-xrandr' 'openal')
provides=('minecraft')
replaces=('minecraft')
source=('minecraft'
        'minecraft.desktop'
        'minecraft.png'
        'readme.txt'
        'https://nofile.io/g/saQYaSojK4EZgdfC224QbvOdOvu0LRt8grlJmUeH8JB900k1qb7ivWE5i23dYEkX/ShiginimaSE_v4100.zip')
sha256sums=('ee83fe03a964489fe201d786dfb10f6a31afdb96b1b7fd983e4c45e9ab8675bf'
            'b6a74142c394fe874206d3f5b9cbdc809972f4c39351e2a112cc92e72d3d6181'
            '81dfe3dea0a61bb314dd95271903ded6fff35cec0751794cbd33b3fc838f060e'
            'bd086bc827b404cf91a28282fc692cdf8bc97f7488b12d08828913a94d304f22'
            '07a06b69903781949c6eec7e52e5a2c427158a31463f8d8ae37ab46e2519fb51')
install=minecraft.install

_jarversion='v4.100'

package() {
    cd "$srcdir"

    mkdir -p $pkgdir/usr/bin
    cp minecraft $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/minecraft
    cp "$srcdir/ShiginimaSE_${_jarversion/./}/Jar For OSX-Linux-Windows/Shiginima Launcher SE $_jarversion.jar" \
        $pkgdir/usr/share/minecraft/MinecraftSP.jar

    # Desktop launcher with icon
    install -Dm644 $srcdir/minecraft.desktop $pkgdir/usr/share/applications/minecraft.desktop
    install -Dm644 $srcdir/minecraft.png     $pkgdir/usr/share/pixmaps/minecraft.png

    # Readme
    install -Dm644 $srcdir/readme.txt        $pkgdir/usr/share/minecraft/readme.txt
}
