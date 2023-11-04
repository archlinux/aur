# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=2.101
pkgrel=1
pkgdesc='A variable font for medievalists'
arch=('any')
url="https://github.com/psb1558/${pkgbase^}"
license=('OFL')
source=("$url/releases/download/v$pkgver/${_name^}_v$pkgver.zip")
sha256sums=('43a1e1e55778842131b8900a64f7d1312f72fac15732a2b852a40c54cb42f0f6')

package_otf-elstob() {
    provides=("$pkgbase" "$pkgname-desktop")
    conflicts=("$pkgbase-variable")
    replaces=("$pkgname-desktop")
    cd "${_name^}_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-elstob() {
    provides=("$pkgbase" "$pkgname-desktop")
    conflicts=("$pkgbase-variable")
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
