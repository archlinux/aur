#Maintainer: Daniel Leining <daniel@the-beach.co>
pkgname=magiclauncher
pkgver=1.2.6
pkgrel=1
pkgdesc="A custom minecraft launcher"
arch=(any)
license=('custom')
url="http://www.minecraftforum.net/topic/939149-launcher-magic-launcher-099-mods-options-news/"
depends=('java-runtime' 'xorg-server-utils' 'openal')
noextract=("MagicLauncher_$pkgver.jar")
source=('magiclauncher' 
	'magiclauncher.desktop'
	'magiclauncher.png'
	"magiclauncher.jar::http://magiclauncher.com/download.php?f=MagicLauncher_$pkgver.jar")

md5sums=('0bbbe81d3cc79b2de68be50357da8ec2'
'ee8801b5238cce051e89fc16641f2cb3'
'b2c25797bf513a5ee215dd90b4b828e3'
'1491E5B3B01FD346CCC7CF6450DD1126')
package() {
    cd "$srcdir" || return 1
    install -D -m755 "${srcdir}/magiclauncher"         "${pkgdir}/usr/bin/magiclauncher"
    install -D -m644 "${srcdir}/magiclauncher.jar"     "${pkgdir}/usr/share/magiclauncher/magiclauncher.jar"
    install -D -m644 "${srcdir}/magiclauncher.desktop" "${pkgdir}/usr/share/applications/magiclauncher.desktop"
    install -D -m644 "${srcdir}/magiclauncher.png"     "${pkgdir}/usr/share/pixmaps/magiclauncher.png"
}
