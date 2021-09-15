# Maintainer: Parham Alvani <1995parham@tuta.io>

pkgname='jcal'

pkgver="0.4.1"
pkgrel=1

pkgdesc="Jalali calendar is a small and portable free software library to manipulate date and time in Jalali calendar system"
url="http://www.nongnu.org/jcal/"

arch=('any')
license=('GPL3')
provides=('jcal')
conflicts=('jcal-bin' 'jcal-git')
depends=()
source=("https://github.com/persiancal/jcal/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
	cd "${srcdir}/jcal-${pkgver}/sources" || exit
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/jcal-${pkgver}/sources" || exit
	make DESTDIR=$pkgdir install
}
