# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=jwx
pkgver=3.0
pkgrel=2
pkgdesc="A Java short-wave weatherfax receiver/converter"
arch=('any')
url="https://arachnoid.com/JWX/"
license=('GPL-2.0-or-later')
depends=('java-runtime' 'bash')
source=("https://arachnoid.com/JWX/resources/JWX.jar"
        "$pkgname.sh"
        "$pkgname.desktop"
        "https://arachnoid.com/JWX/resources/JWX_source.tar.bz2")
sha256sums=('6fedb44ce127995abda23626e1b9e47c7d9c444f449ebfe5863d8b0a35e9f1bd'
            '1b1c17ae670b857a94d7ad84e06292687860ebd684aee2dc85067fd746546a85'
            '42f3f258608ce692d4c1db49273668ed0ff90e16c5f959cc31387fa0ca7c4cb3'
            '0c7ddb9411cee18035367bc9a6eebd4e5e790a0253fd2a14f761431bd9da9eb8')

package() {
    install -Dm644 "$srcdir/JWX.jar" "$pkgdir/usr/share/java/$pkgname/JWX.jar"
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/src/jwx/images/JWX_icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
