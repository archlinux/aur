# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=elstob
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.006
pkgrel=1
pkgdesc='A variable font for medievalists '
arch=('any')
url="https://github.com/psb1558/${pkgbase^}"
license=('OFL')
source=("$url/releases/download/v$pkgver/${_name^}_v${pkgver/./_}_desktop.zip"
        "$url/releases/download/v$pkgver/${_name^}_v${pkgver/./_}_web.zip")
sha256sums=('f316acfb7eb916cafec878f4c826e269556cc485c9131efae0001ae4342ef777'
            '836ac7f43275451cfc74a347937ccc5d106d05214452480cc7014430a2d0d8d9')

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
