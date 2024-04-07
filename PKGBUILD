# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=jwx
pkgver=3.0
pkgrel=2
pkgdesc="A Java short-wave weatherfax receiver/converter"
arch=('any')
url="https://arachnoid.com/JWX/"
license=('GPL3')
depends=('java-runtime' 'bash')
source=("https://arachnoid.com/JWX/resources/JWX.jar"
        "$pkgname.sh"
        "$pkgname.desktop"
        # icon file is extracted from https://arachnoid.com/JWX/resources/JWX_source.tar.bz2
        "JWX_icon.png")
sha256sums=('6fedb44ce127995abda23626e1b9e47c7d9c444f449ebfe5863d8b0a35e9f1bd'
            '1b1c17ae670b857a94d7ad84e06292687860ebd684aee2dc85067fd746546a85'
            '42f3f258608ce692d4c1db49273668ed0ff90e16c5f959cc31387fa0ca7c4cb3'
            'ba35301620db258107ef1d5cc0f4d821bc9e3e16ff3d40fa59085cc520cb8b67')

package() {
    install -Dm644 "$srcdir/JWX.jar" "$pkgdir/usr/share/java/$pkgname/JWX.jar"
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/JWX_icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
