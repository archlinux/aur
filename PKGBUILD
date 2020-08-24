# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.007
pkgrel=1
pkgdesc='A variable font for medievalists '
arch=('any')
url="https://github.com/psb1558/${pkgbase^}"
license=('OFL')
source=("$url/releases/download/v$pkgver/${_name^}_v${pkgver/./_}_desktop.zip"
        "$url/releases/download/v$pkgver/${_name^}_v${pkgver/./_}_web.zip")
sha256sums=('1e653fb5e71b0477ac52cccec04b395eb9162cc8ed209bd33eb92230267bb9dc'
            '05929e1db89f1abc4ac6d3b731080277cdee1f85a316cd06bd7e2c8696d9dd18')

package_otf-elstob() {
    provides=("$pkgbase")
    cd "${_name^}_font_web"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-elstob() {
    provides=("$pkgbase")
    cd "${_name^}_font_desktop"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ttf/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-elstob-variable() {
    provides=("$pkgbase-variable")
    cd "${_name^}_font_web"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" variable/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
