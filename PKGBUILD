# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.011
pkgrel=1
pkgdesc='A variable font for medievalists '
arch=('any')
url="https://github.com/psb1558/${pkgbase^}"
license=('OFL')
source=("$url/releases/download/v${pkgver}/${_name^}_v${pkgver/./_}_desktop.zip"
        "$url/releases/download/v${pkgver}/${_name^}_v${pkgver/./_}_web.zip")
sha256sums=('91f15310801a08a8543f21220a27a0a181eaab946beffce985116e8cf8548936'
            'd28a10e863d053cceda101caef072cd50b4e1b6693a0961a405c10f403dbc4b1')

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
