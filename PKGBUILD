# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=posixovl
pkgver=1.2
pkgrel=1
pkgdesc='A FUSE filesystem that provides POSIX functionality'
arch=(i686 x86_64)
url="http://sourceforge.net/projects/posixovl/"
license=('GPL2')
depends=('fuse')
provides=()
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz)
md5sums=('02630aba4478f661ec6a247338a3d54e')

build() {
	cd "$srcdir/$pkgname"
	
	./autogen.sh
	./configure --prefix=/usr
	
	make
}

package() {
	cd "$srcdir/$pkgname"
	
	make DESTDIR="$pkgdir" install
}

#category: system
# vim:set ts=2 sw=2 et:
