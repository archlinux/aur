# Maintainer: Michał Kazior <kazikcz at gmail dot com>
pkgname=xidle
pkgver=24102005
pkgrel=1
epoch=
pkgdesc="xidle runs a program on X inactivity"
arch=(i686 x86_64)
url="http://www.freshports.org/x11/xidle"
license=('BSD')
groups=()
depends=(libxss libxext libx11)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(Makefile LICENSE http://distcache.freebsd.org/local-distfiles/novel/$pkgname-$pkgver.tar.bz2)
noextract=()


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make -f ../Makefile
}

check() {
	return 0
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make -f ../Makefile DESTDIR="$pkgdir/" install
	install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('acfd0e9b0f8e9d123edd9f7575696981'
         'fc5e113e43e90e9b23299ee186aca0c8'
         '6d4067b5adac594aa5917f2265cc02ee')
