#Maintainer: Geoffrey Frogeye <geoffrey@frogeye.fr>
pkgname=magiclauncher
pkgver=1.3.4
pkgrel=1
pkgdesc="A custom minecraft launcher"
arch=(any)
license=('custom')
url="http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-tools/1262884-launcher-magic-launcher-1-3-4-mods-options"
depends=('java-runtime' 'xorg-server-utils' 'openal')
noextract=("MagicLauncher_$pkgver.jar")
source=('magiclauncher' 
	'magiclauncher.desktop'
	'magiclauncher.png'
	"magiclauncher.jar::http://magiclauncher.com/download.php?f=MagicLauncher_$pkgver.jar")

md5sums=('0bbbe81d3cc79b2de68be50357da8ec2'
'ee8801b5238cce051e89fc16641f2cb3'
'b2c25797bf513a5ee215dd90b4b828e3'
'7c20175aa84819b72bc77fce1c629ea4')
package() {
    cd "$srcdir" || return 1
    install -D -m755 "${srcdir}/magiclauncher"         "${pkgdir}/usr/bin/magiclauncher"
    install -D -m644 "${srcdir}/magiclauncher.jar"     "${pkgdir}/usr/share/magiclauncher/magiclauncher.jar"
    install -D -m644 "${srcdir}/magiclauncher.desktop" "${pkgdir}/usr/share/applications/magiclauncher.desktop"
    install -D -m644 "${srcdir}/magiclauncher.png"     "${pkgdir}/usr/share/pixmaps/magiclauncher.png"
}
