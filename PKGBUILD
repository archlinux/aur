# Maintainer: Your Name <doganntaylan@gmail.com>
pkgname=karakaplidefter
pkgver=1
pkgrel=1
pkgdesc="IUE CE 350 Class project"
arch=('x86_64')
license=('GPL')
depends=('qt5-base' 'git' 'sqlite')
makedepends=('qt5-base' 'git' 'sqlite')
checkdepends=()
#install=
#changelog=
source=("git://github.com/koguz/karakaplidefter")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

prepare() {
	cd "$pkgname"
	qmake -project
	echo "QT += sql widgets printsupport" >> karakaplidefter.pro
}

build() {
	cd "${srcdir}/${pkgname}"
	qmake
	make
}

check() {
	cd "$srcdir/$pkgname"
	make -k check
}

package() {
	cd "${srcdir}/${pkgname}"
	install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
	#make DESTDIR="$pkgdir/" install
}
