pkgname=picori-bin
pkgver=v0.8.0
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
sha256sums_x86_64=('781598668574214e8f3985bff660f80dbf88d19c2f61aac3ecebfbf1e80913eb')
sha256sums_aarch64=('54a02159ad4e223fe118af25d45d2a193056b917c77361cca0d198a5a791f0ff')
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
