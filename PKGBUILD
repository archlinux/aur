# Maintainer: <oliver < a t > first . in-berlin . de>

pkgname=multiple
pkgver=0.5.2
pkgrel=2
pkgdesc="Program to detect (and optionally delete) files with same contents."
arch=('i686' 'x86_64')
license=('GPL3')
source=(http://www.first.in-berlin.de/software/tools/multiple/multiple-0.5.2.tgz)
md5sums=('7bc8de45be1f91278e67103dfe3f2899')
url="http://www.first.in-berlin.de/software/tools/multiple/"


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
