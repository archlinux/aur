# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=2.103
pkgrel=1
pkgdesc='A variable font for medievalists'
arch=(any)
url="https://github.com/psb1558/${pkgbase^}"
license=(OFL)
source=("$url/releases/download/v$pkgver/${_name^}_$pkgver.zip")
sha256sums=('a3c1898db4f707079651c1409ae6010affb72510e0c695a2c83ffc2bfa063d52')

package_otf-elstob() {
    provides=("$pkgbase" "$pkgname-desktop")
    replaces=("$pkgname-desktop")
    cd "${_name^}_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-elstob() {
    provides=("$pkgbase" "$pkgname-desktop")
    replaces=("$pkgname-desktop")
    cd "${_name^}_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ttf/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-elstob-variable() {
    provides=("$pkgbase-variable")
    cd "${_name^}_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" variable/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
