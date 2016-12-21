# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=morpheus
pkgver=272
pkgrel=1
pkgdesc="A mass spectrometry–based proteomics database search algorithm"
arch=('any')
url="http://cwenger.github.io/Morpheus/"
license=('MIT')
depends=('mono')
source=("https://github.com/cwenger/Morpheus/releases/download/r${pkgver}/Morpheus_mzML_Mono.tar.gz"
        "morpheus_cl"
        "morpheus")
install=${pkgname}.install
md5sums=('fdcb22eede1757083b3afe87f7c9f4a1'
         '71ab85a987af41daf56c3b806c53c49b'
         '13af6d888daf9c4a30ec7253312a67b3')

package() {
    opt="$pkgdir/opt/$pkgname"
    install -d "$opt"
    install -D "$srcdir/morpheus_cl" "$pkgdir/usr/bin/morpheus_cl"
    install -D "$srcdir/morpheus" "$pkgdir/usr/bin/morpheus"
    cp -rT "$srcdir/Morpheus (mzML Mono)" "$opt"
    rm "$opt"/MIT_License.*.txt
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/Morpheus (mzML Mono)"/MIT_License.{CommandLine,Morpheus}.txt
}
