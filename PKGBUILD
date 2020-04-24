# Maintainer:  Frank Seifferth <frankseifferth@posteo.net>

pkgname=abricotine-bin
_pkgname=abricotine
conflicts=("abricotine")
provides=("abricotine")
pkgver=1.0.0
pkgrel=1
pkgdesc="A markdown editor with inline preview"
arch=('x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
depends=('libxss')
source=("https://github.com/brrd/Abricotine/releases/download/$pkgver/Abricotine-$pkgver-linux-x64.tar.gz"
        "abricotine.desktop")
sha256sums=('f3bbee75c7f5bc09e445546869582e1c7a09c0c269b22339f9cff79bd948c517'
            '164d0042ffe461ca0418709a59be29b433055589b661be4d6555c07df42b383c')

package() {
    cd "$srcdir/Abricotine-linux-x64"

    install -d "$pkgdir/opt/abricotine"
    cp -r * "$pkgdir/opt/abricotine"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/abricotine/abricotine" "$pkgdir/usr/bin/abricotine"

    install -Dm644 "../abricotine.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "icons/abricotine@2x.png" "$pkgdir/usr/share/pixmaps/abricotine.png"
}
