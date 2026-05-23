pkgname=picori-bin
pkgver=v0.2.2.0
pkgrel=1
scriptver=1.0.0
arch=('x86_64')
license=('GPL')
depends=('sdl3' 'git' 'zenity' 'yad')
url='https://github.com/999sian/tmc'
_pkgrel_x86_64=1
sha256sums=('f88044425f155c8fc57ac3878865d8b22e1fc206c75bfb5e0a134310a5cbc442')
sha256sums_x86_64=('b5c40128e677ebbc1ef8d6b839a54650569435132fa941376691d786a59b9c61')
source=("https://gitlab.com/linuxbombay/picori/-/archive/$scriptver/picori-$scriptver.tar.bz2")
source_x86_64=("$url/releases/download/$pkgver/tmc-usa-linux-x86_64-$pkgver.tar.gz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/Picori"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"

    install -Dm655 "$srcdir/picori-$scriptver/picori.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/picori-$scriptver/picori.desktop" "$pkgdir/usr/share/applications"
    install -m775 "$srcdir/tmc_pc" "$pkgdir/usr/share/games/Picori"
    cp -r "$srcdir/sounds.json" "$pkgdir/usr/share/games/Picori"
    install -m775 "$srcdir/asset_extractor" "$pkgdir/usr/share/games/Picori"
    install -m775 "$srcdir/picori-$scriptver/picori" "$pkgdir/usr/bin"
    printf '%s\n' "$pkgver" > "$pkgdir/usr/share/games/Picori/version.txt"
}
