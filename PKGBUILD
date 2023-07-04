# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-desktop ttf-$_name-variable)
pkgver=1.015
pkgrel=2
pkgdesc='A variable font for medievalists'
arch=('any')
url="https://github.com/psb1558/${pkgbase^}"
license=('OFL')
source=("$url/releases/download/v${pkgver}/${_name^}_v${pkgver/./_}a.zip")
sha256sums=('49ba6c661e473708d4a0b4932c3c89b5c2519c62701fdbe44f441bb50a0bfab0')

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
