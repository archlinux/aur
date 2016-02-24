# Maintainer: Ole Erik Brennhagen (elo@tuta.io)
# Contributor: shinnova

pkgname="indivisible-prototype"
pkgver="1"
pkgrel="4"
pkgdesc="Action/RPG prototype"
arch=('i686' 'x86_64')
url="http://indivisiblegame.com"
options=('!strip' 'staticlibs')
license=("custom")
depends=("sdl_image" "libgl" "sdl_mixer" "glu" "curl")
source=("http://www.labzerogames.com/indivisible-prototype_linux.tar.gz"
	indivisible-prototype.desktop)
md5sums=("d9f68fabe1b491474d764524bc58a34b"
	"64cc43168d19bcd3032f50167583ca28")

package() {
    cd $srcdir
    install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/opt/${pkgname}"
    install -Dm755 Indivisible_Linux.i686-pc-linux-gnu "${pkgdir}/opt/${pkgname}/Indivisible_Linux.i686-pc-linux-gnu"
    install -Dm644 indivisible-prototype.desktop "${pkgdir}"/usr/share/applications/indivisible-prototype.desktop
    cp -dr Salmon/ "${pkgdir}/opt/${pkgname}/Salmon"
    cp -dr lib/ "${pkgdir}/opt/${pkgname}/lib"
    cp -dr pkgs/ "${pkgdir}/opt/${pkgname}/pkgs"
    ln -s /opt/$pkgname//Indivisible_Linux.i686-pc-linux-gnu $pkgdir/usr/bin/$pkgname
}

