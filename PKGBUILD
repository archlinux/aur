# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=3.002
pkgrel=1
pkgdesc='A variable font for medievalists'
arch=(any)
url="https://github.com/psb1558/${pkgbase^}"
license=(OFL)
source=("$url/releases/download/v$pkgver/${_name^}_$pkgver.zip")
sha256sums=('22b1a96272712847bb2a1f0406bade83045b1fdafd6b0ccce0541e1826746aa0')

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
