# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msamanda
pkgver=2.0.0.14665
pkgrel=1
pkgdesc="A scoring system to identify peptides out of tandem mass spectrometry data using a database of known proteins"
arch=('any')
url="http://ms.imp.ac.at/index.php?action=ms-amanda"
license=('custom')
depends=('mono')
options=()
source=("http://ms.imp.ac.at/index.php?file=msamanda/MSAmanda2.0_Standalone_${pkgver}.zip"
        "msamanda")
md5sums=('3d0e05c8bc3f6237bfc1f111260e2466'
         'a870877935f5aed33fd0a7ec73e5abca')

package() {
    mkdir -p "$pkgdir/opt/MSAmanda"
    cp -rt "$pkgdir/opt/MSAmanda" "$srcdir"/*
    rm "${pkgdir}/opt/MSAmanda/MSAmanda2.0_Standalone_${pkgver}.zip" "${pkgdir}/opt/MSAmanda/msamanda"
    mkdir -p "$pkgdir/usr/bin"
    cp -L msamanda "$pkgdir/usr/bin"
}
