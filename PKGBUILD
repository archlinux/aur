# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=jalgo
pkgver=0.0.1
pkgrel=1
epoch=1
pkgdesc='Algorithm visualization tool written in Java developed at TU Dresden'
arch=('any')
url='https://github.com/tud-fop/j-Algo'
license=('GPL2')
depends=('java-runtime>=8')
optdepends=('jalgo-doc: documentation')
source=("https://github.com/tud-fop/j-Algo/releases/download/v$pkgver/jalgo.zip")
md5sums=('f09fa85c5d407f7a3ccb312c7a1d4d46')
sha256sums=('163c3f889896bdd14411d1b216a6397bacd37793f962091fcbaf34c530125c46')

package() {
    # Install jalgo release
    mkdir -p "$pkgdir/usr/lib/jalgo"
    cp -ar "$srcdir"/{examples,runtime,*.jar} "$pkgdir/usr/lib/jalgo/"

    # Create link at /usr/bin
    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/lib/jalgo/jalgo.sh "$pkgdir/usr/bin/jalgo"

    # Install patched launch script
    install -m 755 ../jalgo.sh "$pkgdir/usr/lib/jalgo/jalgo.sh"

    # Install desktop shortcut and icon
    install -Dm 644 ../jalgo.desktop "$pkgdir/usr/share/applications/jalgo.desktop"
    install -Dm 644 ../jalgo.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/jalgo.png"
}
