# Maintainer: Jan Kroulik <jk at wo dot cz>

pkgname=xerox-workcentre-3045b-3045ni
pkgver=1.0_28
pkgrel=1
pkgdesc="Xerox WorkCentre 3045 printer driver for CUPS."
arch=(i686 x86_64)
url="http://www.support.xerox.com/support/workcentre-3045"
source=("${pkgname}-${pkgver}.zip"::"http://www.support.xerox.com/support/workcentre-3045/file-redirect/enin.html?operatingSystem=linux&fileLanguage=en_GB&contentId=118990")
source=("${pkgname}-${pkgver}.zip"::"https://www.support.xerox.com/download/118990")
license=('custom')
md5sums=('cd8159e18589c463953c44a55d64c48c')
sha1sums=('9059c3321eaf54115544795cd91467d10d1824eb')

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
