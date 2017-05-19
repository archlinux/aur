# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Contributor: Jan Kroulik <jk at wo dot cz>

pkgname=xerox-workcentre-3025
pkgver=1.0_25
pkgrel=1
pkgdesc="Xerox WorkCentre 3025 printer driver for CUPS."
arch=(i686 x86_64)
url="http://www.support.xerox.com/support/workcentre-3025"
source=("${pkgname}-${pkgver}.zip"::"http://www.support.xerox.com/support/workcentre-3025/file-download/eneg.html?operatingSystem=linux&fileLanguage=en_GB&contentId=129628")

license=('custom')
sha1sums=('14a870aa348906e840b2ad224a95a562c3b7cf8a')

makedepends=('binutils' 'tar')
depends_x86_64=('lib32-libcups')
depends_i686=('libcups')

prepare() {
    cd ${srcdir}
    ar x *.deb
    tar xf data.tar.gz
}

package() {
     mv "${srcdir}"/usr "${pkgdir}"
}
