# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=morpheus
pkgver=200
pkgrel=1
pkgdesc="A mass spectrometry–based proteomics database search algorithm"
arch=('any')
url="http://sourceforge.net/projects/morpheus-ms/"
license=('MIT')
depends=('mono')
source=("http://sourceforge.net/projects/morpheus-ms/files/revision%20${pkgver}/Morpheus%20%28mzML%20Linux%29.tar.gz/download"
        "morpheus_cl"
        "morpheus")
install=${pkgname}.install
md5sums=('cf12f9244d70d5aee4565dca470cbe1e'
         '71ab85a987af41daf56c3b806c53c49b'
         '274d39f13400d681af86fa8a51c4e758')

package() {
    opt="$pkgdir/opt/$pkgname"
    install -d "$opt"
    install -D "$srcdir/morpheus_cl" "$pkgdir/usr/bin/morpheus_cl"
    install -D "$srcdir/morpheus" "$pkgdir/usr/bin/morpheus"
    cp -rT "$srcdir/Morpheus (mzML Linux)" "$opt"
    rm "$opt"/MIT_License.*.txt
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/Morpheus (mzML Linux)"/MIT_License.{CommandLine,Morpheus}.txt
}
