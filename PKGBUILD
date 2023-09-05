# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msamanda-bin
provides=(msamanda percolator)
conflicts=(msamanda percolator percolator-bin)
_name="MSAmanda_Linux"
pkgver=3.0.21.049
pkgrel=1
pkgdesc="A scoring system to identify peptides out of tandem mass spectrometry data using a database of known proteins"
arch=('any')
url="http://ms.imp.ac.at/index.php?action=ms-amanda"
license=('custom')
depends=()
options=(!strip)
source=("https://ms.imp.ac.at/index.php?file=msamanda/${_name}_${pkgver}.tar.gz")
sha256sums=('2479fd56576b68bbc582d2117a2e6bffa67d8e9e2df538d156371c6bf82c8f86')

package() {
    mkdir -p "$pkgdir/opt/MSAmanda"
    cp -rt "$pkgdir/opt/MSAmanda" "${srcdir}/${_name}_${pkgver}"/*
    mkdir -p "$pkgdir/usr/share/licenses/MSAmanda"
    mv "$pkgdir/opt/MSAmanda/license.txt" "$pkgdir/usr/share/licenses/MSAmanda"
    mkdir -p "$pkgdir/usr/bin"
    ln -st "${pkgdir}/usr/bin" /opt/MSAmanda/percolator/{percolator,qvality}
    ln -st "${pkgdir}/usr/bin" /opt/MSAmanda/MSAmanda
}
