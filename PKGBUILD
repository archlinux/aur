# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=3.003
pkgrel=1
pkgdesc='A variable font for medievalists'
arch=(any)
url="https://github.com/psb1558/${pkgbase^}"
license=(OFL)
source=("$url/releases/download/v$pkgver/${_name^}_$pkgver.zip")
sha256sums=('719519489d44ed5cb87e6db4f4a44dab6933dde93d4b8d5926df2981878b8150')

package_otf-elstob() {
    provides=("$pkgbase" "$pkgname-desktop")
    replaces=("$pkgname-desktop")
    cd "${_name^}_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" otf/ElstobD*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-elstob() {
    provides=("$pkgbase" "$pkgname-desktop")
    replaces=("$pkgname-desktop")
    cd "${_name^}_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ttf/ElstobD*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-elstob-variable() {
    provides=("$pkgbase-variable")
    cd "${_name^}_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" variable/Elstob*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
