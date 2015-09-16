# Maintainer: Guilhem Saurel <guilhem@saurel.me>
pkgname=tabula
pkgver=1.0.1
pkgrel=3
pkgdesc="tool for liberating data tables trapped inside PDF files"
arch=('any')
url="http://tabula.technology/"
license=('custom')
depends=('java-runtime')
source=(
    "https://github.com/tabulapdf/$pkgname/releases/download/v$pkgver/$pkgname-jar-$pkgver.zip"{,.asc}
    "run.sh"
)
md5sums=('bfe483ead916ef1ddc00c6194822e5ad'
         'SKIP'
         'e8ac81e308cf729eacef453fc476e55c')
validpgpkeys=("4034E60AA7827C5DF21A89AAA993E7156E0E9923")

package() {
    mkdir -p "$pkgdir/usr/share/java/$pkgname" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
    install -D -m644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "$srcdir/$pkgname/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -D -m755 "$srcdir/run.sh" "$pkgdir/usr/bin/$pkgname"
}
