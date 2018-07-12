# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msamanda
pkgver=2.0.0.11219
pkgrel=1
pkgdesc="A scoring system to identify peptides out of tandem mass spectrometry data using a database of known proteins"
arch=('any')
url="http://ms.imp.ac.at/index.php?action=ms-amanda"
license=('custom')
depends=('mono')
options=()
source=("http://ms.imp.ac.at/index.php?file=MSAmanda2.0_Standalone_${pkgver}.zip"
        "msamanda")
md5sums=('2fe864851ee26ac5f86cee8fe243cdf3'
         'a870877935f5aed33fd0a7ec73e5abca')

package() {
    mkdir -p "$pkgdir/opt/MSAmanda"
    cp -rt "$pkgdir/opt/MSAmanda" "$srcdir"/*
    rm "${pkgdir}/opt/MSAmanda/index.php?file=MSAmanda2.0_Standalone_${pkgver}.zip" "${pkgdir}/opt/MSAmanda/msamanda"
    mkdir -p "$pkgdir/usr/bin"
    cp -L msamanda "$pkgdir/usr/bin"
}
