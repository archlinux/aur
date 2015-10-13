# Maintainer: Ole Erik Brennhagen (elo@tuta.io)

pkgname="indivisible-prototype"
pkgver="1"
pkgrel="3"
pkgdesc="Action/RPG prototype"
arch=('any')
url="http://indivisiblegame.com"
options=('!strip' 'staticlibs')
license=("custom")
depends=("sdl_image" "libgl" "sdl_mixer" "glu" "curl")
source=("http://www.labzerogames.com/indivisible-prototype_linux.tar.gz")
md5sums=("SKIP")

package() {
    cd $srcdir
    install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/opt/${pkgname}"
    install -Dm755 Indivisible_Linux.i686-pc-linux-gnu "${pkgdir}/opt/${pkgname}/Indivisible_Linux.i686-pc-linux-gnu"
    install -Dm644 "package.md5" "${pkgdir}/opt/${pkgname}/package.md5"
    cp -dr Salmon/ "${pkgdir}/opt/${pkgname}/Salmon"
    cp -dr lib/ "${pkgdir}/opt/${pkgname}/lib"
    cp -dr pkgs/ "${pkgdir}/opt/${pkgname}/pkgs"
    ln -s /opt/$pkgname//Indivisible_Linux.i686-pc-linux-gnu $pkgdir/usr/bin/$pkgname
}

