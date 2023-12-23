# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=2.104
pkgrel=1
pkgdesc='A variable font for medievalists'
arch=(any)
url="https://github.com/psb1558/${pkgbase^}"
license=(OFL)
source=("$url/releases/download/v$pkgver/${_name^}_$pkgver.zip")
sha256sums=('f20439bf6de7c4dd177b013fe5f262cad30bc8caedd07245ad5dfe2b8e9231cc')

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
