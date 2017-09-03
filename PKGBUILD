#Maintainer: Geoffrey Frogeye <geoffrey@frogeye.fr>
pkgname=magiclauncher
pkgver=1.3.4
pkgrel=3
pkgdesc="A custom minecraft launcher"
arch=(any)
license=('custom')
url="http://www.minecraftforum.net/forums/mapping-and-modding/minecraft-tools/1262884-launcher-magic-launcher-1-3-4-mods-options"
depends=('java-runtime' 'openal' 'xorg-xrandr' 'ttf-font' 'libxtst')
noextract=("MagicLauncher_$pkgver.jar")
source=('magiclauncher' 
	'magiclauncher.desktop'
	'magiclauncher.png'
	"magiclauncher.jar::http://magiclauncher.com/download.php?f=MagicLauncher_$pkgver.jar")

md5sums=('332a2287799ce44c9b09a4548713b82a'
         'ee8801b5238cce051e89fc16641f2cb3'
         'd3bd6c5a02ab76c50c85cb2a138bdae3'
         '7c20175aa84819b72bc77fce1c629ea4')
package() {
    cd "$srcdir" || return 1
    install -D -m755 "${srcdir}/magiclauncher"         "${pkgdir}/usr/bin/magiclauncher"
    install -D -m644 "${srcdir}/magiclauncher.jar"     "${pkgdir}/usr/share/magiclauncher/magiclauncher.jar"
    install -D -m644 "${srcdir}/magiclauncher.desktop" "${pkgdir}/usr/share/applications/magiclauncher.desktop"
    install -D -m644 "${srcdir}/magiclauncher.png"     "${pkgdir}/usr/share/pixmaps/magiclauncher.png"
}
