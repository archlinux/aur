# Maintainer: <oliver < a t > first . in-berlin . de>

pkgname=multiple
pkgver=0.5.6
pkgrel=1
pkgdesc="Program to detect (and optionally delete) files with same contents."
arch=('i686' 'x86_64')
license=('GPL3')
source=(https://www.first.in-berlin.de/software/tools/multiple/multiple-0.5.6.tgz)
md5sums=('031f94486edfbb0bfd9bd011769f7c15')
url="https://www.first.in-berlin.de/software/tools/multiple/"


build() {
cd ${srcdir}/${pkgname}-${pkgver}
make
}


package() {
cd ${srcdir}/${pkgname}-${pkgver}

make PREFIX="$pkgdir"/usr/ install

cp multiple.man  multiple.1
gzip multiple.1
install -Dm 644 multiple.1.gz  ${pkgdir}/usr/share/man/man1/multiple.1.gz
}
