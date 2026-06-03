pkgname=picori-bin
pkgver=v0.4.0
pkgrel=1
scriptver=1.0.0
pkgdesc='Decompilation of The Legend of Zelda: The Minish Cap (USA/JP/EU)'
arch=('x86_64')
license=('GPL')
depends=('sdl3' 'git' 'zenity' 'yad')
url='https://github.com/999sian/tmc'
_pkgrel_x86_64=1
sha256sums=('f88044425f155c8fc57ac3878865d8b22e1fc206c75bfb5e0a134310a5cbc442')
sha256sums_x86_64=('2766ed71c2357408cb7ccb37dabc6d014c3b46045d089ea75c5e81b114440144')
source=("https://gitlab.com/linuxbombay/picori/-/archive/$scriptver/picori-$scriptver.tar.bz2")
source_x86_64=("$url/releases/download/$pkgver-experimental/tmc-usa-linux-x86_64-$pkgver-experimental.tar.gz")
package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/Picori"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"

    install -Dm655 "$srcdir/picori-$scriptver/picori.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/picori-$scriptver/picori.desktop" "$pkgdir/usr/share/applications"
    install -m775 "$srcdir/tmc_pc" "$pkgdir/usr/share/games/Picori"
    #cp -r "$srcdir/sounds.json" "$pkgdir/usr/share/games/Picori"
    cp -r "$srcdir/picori-$scriptver/picori.png" "$pkgdir/usr/share/games/Picori"
    #install -m775 "$srcdir/asset_extractor" "$pkgdir/usr/share/games/Picori"
    install -m775 "$srcdir/picori-$scriptver/picori" "$pkgdir/usr/bin"
    printf '%s\n' "$pkgver" > "$pkgdir/usr/share/games/Picori/version.txt"
}
