# Maintainer: Mahor Foruzesh <mahorforuzesh at pm dot me>

pkgname=tachidesk-sorayomi-bin
__pkgname=tachidesk-sorayomi
__PkgName=Tachidesk-Sorayomi
__binname=tachidesk_sorayomi
pkgver=0.1.1
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$__PkgName"
license=('MPL2')
depends=('zenity')
provides=("$__pkgname")
source=("$url/releases/download/$pkgver/$__pkgname-$pkgver-linux-x64.tar.gz")
sha256sums=('331ca1ffcbf459d44d01fcc0e7cc6fab3a90a0e81fb852df791d7795127dbd97')

package() {
    install -dm755 "$pkgdir/opt/$__pkgname/"
    cp -a "$srcdir/data" "$srcdir/lib" "$srcdir/$__binname" "$pkgdir/opt/$__pkgname/"

    install -dm755 "$pkgdir/usr/bin/"
    ln -sr "$pkgdir/opt/$__pkgname/$__binname" "$pkgdir/usr/bin/$__pkgname"
    install -Dm644 "$srcdir/$__pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/$__pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
}
