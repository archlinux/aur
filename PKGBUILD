pkgname=picori-bin
pkgver=v0.9.5
pkgrel=1
scriptver=1.1
pkgdesc='Decompilation of The Legend of Zelda: The Minish Cap (USA/JP/EU)'
arch=('x86_64' "aarch64")
license=('GPL')
depends=('sdl3' 'git')
url='https://github.com/999sian/tmc'
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums=('90556adf2106cea8021333973c115e036d9539d1a86721a41ffaf46737143b1c')
sha256sums_x86_64=('64dbc289c2450357394bf6c7a991ff1c3dfd23b4dc188739106c88c26b4dee81')
sha256sums_aarch64=('c298d7ce616c742d23a3f8131a63c82412613efb57af0851c7abdda301ece9fd')
source=("https://gitlab.com/linuxbombay/picori/-/archive/$scriptver/picori-$scriptver.tar.bz2")
source_x86_64=("$url/releases/download/$pkgver/tmc-multi-linux-x86_64-$pkgver.tar.gz")
source_aarch64=("$url/releases/download/$pkgver/tmc-multi-linux-arm64-$pkgver.tar.gz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/Picori"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"

    install -Dm655 "$srcdir/picori-$scriptver/picori.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/picori-$scriptver/picori.desktop" "$pkgdir/usr/share/applications"
    install -m775 "$srcdir/tmc_pc" "$pkgdir/usr/share/games/Picori"
    cp -r "$srcdir/picori-$scriptver/picori.png" "$pkgdir/usr/share/games/Picori"
    install -m775 "$srcdir/picori-$scriptver/picori" "$pkgdir/usr/bin"
    printf '%s\n' "$pkgver" > "$pkgdir/usr/share/games/Picori/version.txt"
}
