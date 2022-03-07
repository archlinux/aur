# Maintainer: Mahor Foruzesh <mahorforuzesh at pm dot me>

pkgname=tachidesk-sorayomi-bin
__pkgname=tachidesk-sorayomi
__PkgName=Tachidesk-Sorayomi
__binname=tachidesk_sorayomi
pkgver=0.1.0
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$__PkgName"
license=('MPL2')
depends=('zenity')
provides=("$__pkgname")
source=("$url/releases/download/$pkgver/$__pkgname-$pkgver-linux-x64.tar.gz")
sha256sums=('c29b04c312c9054f5a4ee6f2f45a23d315c46a359c9ef7058e90e1c4c5090664')

package() {
    install -dm755 "$pkgdir/opt/"
    cp -a "$srcdir/" "$pkgdir/opt/$__pkgname/"
    rm "$pkgdir/opt/$__pkgname/$__pkgname-$pkgver-linux-x64.tar.gz"

    install -dm755 "$pkgdir/usr/bin/"
    ln -sr "$pkgdir/opt/$__pkgname/$__binname" "$pkgdir/usr/bin/$__pkgname"
    install -Dm644 "$srcdir/$__pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/$__pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
}
