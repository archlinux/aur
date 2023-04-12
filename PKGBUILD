# Maintainer: spsf64 <spsf64  at  g m a i l .com>
# Maintainer: thomasqueirozb <thomasqueirozb  at  g m a i l .com>

pkgname=finanx-12c
pkgver=0.2.8
pkgrel=1
pkgdesc='Free software that mimics the HP-12C financial calculator. NOT RECOMMENDED for professional calculations.'
arch=('x86_64')
license=('GPL3')
url="https://sourceforge.net/projects/finanx/"
depends=('java-runtime<=11')

# The icon is provided by the Finanx-12c project
source=("$pkgname"
        "$pkgname.desktop"
        "https://sourceforge.net/projects/finanx/files/finanx-12c-0.2.8/finanx-12c-0.2.8.zip")

sha256sums=('9a28b1ebf7b7607c3c7fe9668fe339938bea8b17fd344e8a1459df09a7982252'
            '7f6ba24714523349a805697992b21e1c60bf7cec1d0f5d763e7f84f217e30956'
            '934bf5dac28914220315bc90a9befb5506a77bd97faab0f880ffbbced260c1ab')


prepare() {
    cd "$srcdir/finanx-12c-0.2.8/"
    mv COPYING.txt ../copying.txt
    mv finanx.jar ../finanx-12c.jar
    mv icon.png ../finanx-12c.png
    mv LEIA-ME.pdf ../leia-me.pdf
    mv README.pdf ../readme.pdf
    rm finanx.bat
    rm finanx.sh
}

package() {
    cd "$srcdir"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
#   install -Dm644 $pkgname-$pkgver.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
    install -Dm644 $pkgname.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
}

