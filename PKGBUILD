# Maintainer: Jack Lupino <electricalmemory83720x0@protonmail.com>
pkgname=freezer-appimage
pkgver='1.1.10'
pkgrel=1
pkgdesc="A client for Deezer"
arch=('x86_64')
url="https://files.freezer.life"
license=('GPL')
groups=()
depends=()
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
source=("Freezer-$pkgver.AppImage::$url/0:/PC/$pkgver/Freezer-$pkgver.AppImage" "freezer.desktop")
noextract=("Freezer-$pkgver.AppImage")
md5sums=('47ed3f6333a924fc385177bd8793b250' '1c5b66eb9df62e25cf88f307d82b4aa8')

package() {
    install -d -m755 "${pkgdir}/opt/${pkgname}"

    cp -L $srcdir/Freezer-$pkgver.AppImage ${pkgdir}/opt/${pkgname}
    chmod +x ${pkgdir}/opt/${pkgname}/Freezer-$pkgver.AppImage

    install -d -m755 $pkgdir/usr/share/applications/ 
    cp -L $srcdir/freezer.desktop $pkgdir/usr/share/applications/

    install -d -m755 $pkgdir/usr/bin/
    ln -sf /opt/${pkgname}/Freezer-$pkgver.AppImage $pkgdir/usr/bin/freezer
    chmod +x $pkgdir/usr/bin/freezer
}
