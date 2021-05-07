# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-desktop ttf-$_name-variable)
pkgver=1.015
pkgrel=1
pkgdesc='A variable font for medievalists'
arch=('any')
url="https://github.com/psb1558/${pkgbase^}"
license=('OFL')
source=("$url/releases/download/v${pkgver}/${_name^}_v${pkgver/./_}.zip")
sha256sums=('4cd99be64bd5086e806469ee7c8af5f515d667ad4c5eaaa1bd3e63f38bd23128')

package_otf-elstob() {
    provides=("$pkgbase")
    conflicts=("$pkgbase-variable")
    cd "${_name^}_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-elstob() {
    provides=("$pkgbase")
    conflicts=("$pkgbase-variable")
    cd "${_name^}_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ttf/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-elstob-desktop() {
    provides=("$pkgbase")
    cd "${_name^}_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" desktop/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-elstob-variable() {
    provides=("$pkgbase-variable")
    cd "${_name^}_font"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" variable/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
