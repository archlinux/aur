# Maintainer: Guilhem Saurel <guilhem@saurel.me>
pkgname=tabula
pkgver=1.1.1
pkgrel=1
pkgdesc="tool for liberating data tables trapped inside PDF files"
arch=('any')
url="http://tabula.technology/"
license=('custom')
depends=('java-runtime')
source=(
    "https://github.com/tabulapdf/$pkgname/releases/download/v$pkgver/$pkgname-jar-$pkgver.zip"{,.asc}
    "run.sh"
)
md5sums=('78aff9eaf919085818251fb3c078cd4d'
         'SKIP'
         '57939db56d85e62f4212e6bad1030fb6')
validpgpkeys=("4034E60AA7827C5DF21A89AAA993E7156E0E9923")

package() {
    mkdir -p "$pkgdir/usr/share/java/$pkgname" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
    install -D -m644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "$srcdir/$pkgname/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -D -m755 "$srcdir/run.sh" "$pkgdir/usr/bin/$pkgname"
}
