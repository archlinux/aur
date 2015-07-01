# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=morpheus
pkgver=142
pkgrel=1
pkgdesc="A mass spectrometry–based proteomics database search algorithm"
arch=('any')
url="http://sourceforge.net/projects/morpheus-ms/"
license=('MIT')
depends=('mono')
source=("http://sourceforge.net/projects/morpheus-ms/files/revision%20${pkgver}/Morpheus%20%28Linux%29.tar.gz/download"
        "morpheus_cl"
        "morpheus")
md5sums=('a999454c980aebf6ea440d914dca9726'
         'd772495a3c9104c94e3273ca36fbac38'
         'da3b2649a397cbbc0e6803160247cc30')

package() {
    opt="$pkgdir/opt/$pkgname"
    install -d "$opt"
    install -D "$srcdir/morpheus_cl" "$pkgdir/usr/bin/morpheus_cl"
    install -D "$srcdir/morpheus" "$pkgdir/usr/bin/morpheus"
    cp -rT "$srcdir/Morpheus (Linux)" "$opt"
    rm "$opt"/MIT_License.*.txt
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/Morpheus (Linux)"/MIT_License.{CommandLine,Morpheus}.txt
}
