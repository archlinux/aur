# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.009
pkgrel=1
pkgdesc='A variable font for medievalists '
arch=('any')
url="https://github.com/psb1558/${pkgbase^}"
license=('OFL')
source=("$url/releases/download/v${pkgver}a/${_name^}_v${pkgver/./_}_desktop.zip"
        "$url/releases/download/v${pkgver}a/${_name^}_v${pkgver/./_}_web.zip")
sha256sums=('f5fbbd4ff1eaa25458bbec6dfc817de278ea9234bb838e160ea6ef0eda47beb9'
            'f6c32b2d17f22aa49345fb8ddbfb09be865604a870e7e314be17646199407062')

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
