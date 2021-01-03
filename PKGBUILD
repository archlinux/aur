# Maintainer: Jack Lupino <electricalmemory83720x0@protonmail.com>
pkgname=freezer-appimage
pkgver='1.1.11'
pkgrel=2
pkgdesc="An unofficial client for Deezer (AppImage version)"
arch=('x86_64')
url="https://files.freezer.life"
license=('GPL')
groups=()
depends=('zlib')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("Freezer-$pkgver.AppImage::$url/0:/PC/$pkgver/Freezer-$pkgver.AppImage" "freezer.desktop" "https://i.imgur.com/ztam2vH.png")
noextract=("Freezer-$pkgver.AppImage")
md5sums=('a60edc3f9a87e20b9b6ea818bb85c6b5'
    '59bc9ed8c52d157647c7f78f980ca49e'
    '3a8057d8fe5a0aa93f04f45e3a77a352')

package() {
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -L $srcdir/Freezer-$pkgver.AppImage ${pkgdir}/opt/${pkgname}/Freezer.AppImage
    chmod +x ${pkgdir}/opt/${pkgname}/Freezer.AppImage

    install -d -m755 "${pkgdir}/usr/share/applications/"
    cp -L $srcdir/freezer.desktop "${pkgdir}/usr/share/applications/"

    install -d -m755 $pkgdir/usr/share/pixmaps/
    cp -L $srcdir/ztam2vH.png $pkgdir/usr/share/pixmaps/freezer.png
    install -d -m755 $pkgdir/usr/share/applications/ 

    install -d -m755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/Freezer.AppImage" "${pkgdir}/usr/bin/freezer"
}
