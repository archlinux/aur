# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=morpheus
pkgver=288
pkgrel=1
pkgdesc="A mass spectrometry–based proteomics database search algorithm"
arch=('any')
url="http://cwenger.github.io/Morpheus/"
license=('MIT')
depends=('mono')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/cwenger/Morpheus/releases/download/r${pkgver}/Morpheus_mzML_Mono.tar.gz"
        "morpheus_cl"
        "morpheus")
install=${pkgname}.install
md5sums=('f683128d293bb37402a9e5a3e139dfb9'
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
