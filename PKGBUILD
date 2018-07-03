# Maintainer: Guilhem Saurel <guilhem@saurel.me>
pkgname=tabula
pkgver=1.2.1
pkgrel=0
pkgdesc="tool for liberating data tables trapped inside PDF files"
arch=('any')
url="http://tabula.technology/"
license=('custom')
depends=('java-runtime')
source=(
    "https://github.com/tabulapdf/$pkgname/releases/download/v$pkgver/$pkgname-jar-$pkgver.zip"
    "run.sh"
)
md5sums=('c5c1502d72c9691e13b00ee6fe166b1c'
         '57939db56d85e62f4212e6bad1030fb6')

package() {
    mkdir -p "$pkgdir/usr/share/java/$pkgname" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
    install -D -m644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "$srcdir/$pkgname/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -D -m755 "$srcdir/run.sh" "$pkgdir/usr/bin/$pkgname"
}
