# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.008
pkgrel=1
pkgdesc='A variable font for medievalists '
arch=('any')
url="https://github.com/psb1558/${pkgbase^}"
license=('OFL')
source=("$url/releases/download/v$pkgver/${_name^}_v${pkgver/./_}_desktop.zip"
        "$url/releases/download/v$pkgver/${_name^}_v${pkgver/./_}_web.zip")
sha256sums=('beac30da26b00c4c6216b5d87fed8c8057ebec51c7cf27c1fafe030f1bec4e58'
            '33f845a0a3341c2fcef2ee41f99f78f2841bb87c738c714f806073234f36811d')

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
