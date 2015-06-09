# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Pranay Kanwar <warl0ck@metaeye.org>
pkgname=alph
pkgver=0.24
pkgrel=2
pkgdesc="Implements and analyzes historical and traditional c(ai)phers."
url="http://sourceforge.net/projects/alph"
arch=('i686' 'x86_64')
license=('GPL')
changelog=ChangeLog
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c1ca70c2034101828bf6a6996161301331563b4e5a6b3957b3ce33da6c136ba9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
