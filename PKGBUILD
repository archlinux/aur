# Contributor:	Thomas Mudrunka <harvie@@email..cz>
# Maintainer:	Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=gretl
pkgver=2016a
pkgrel=1
pkgdesc='Gnu Regression, Econometrics and Time-series Library'
arch=('any')
url="http://gretl.sourceforge.net/"
license=('GPL')
#depends=('java-runtime' 'desktop-file-utils')
#makedepends=('imagemagick')
source=(
	"http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz"
)

md5sums=('3ca371d114f8aca8bda9ff313e790c5d')

build() {
	cd ${srcdir}/$pkgname-$pkgver

	./configure --prefix=/usr --disable-xdg-utils
	make
}

package() {
	cd ${srcdir}/$pkgname-$pkgver
	make install DESTDIR="${pkgdir}"
}
