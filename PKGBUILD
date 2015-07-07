# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: Jonathan Frawley <jonathanfrawley@gmail.com>

pkgname=xcftools
pkgver=1.0.7
pkgrel=3
pkgdesc="Miscellaneous command line tools for use with the open XCF format used by The GIMP"
url="http://henning.makholm.net/software"
arch=('x86_64' 'i686')
license=('GPL2' 'perl')
depends=('libpng' 'perl')
optdepends=('gimp')
makedepends=('libpng')
source=("http://henning.makholm.net/xcftools/xcftools-${pkgver}.tar.gz"
        "xcftools.patch")
md5sums=('fd960b6470fb23520fc4b1ade6cf6e25'
         '7439f6a8369a12913243ded6c93d31e1')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -i ../xcftools.patch
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

