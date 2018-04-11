# Maintainer: BrainDamage
pkgname="naspro-core"
pkgrel=2
pkgver=0.5.1
pkgdesc="NASPRO core is the portable runtime library at the bottom of the NASPRO Architecture for Sound PROcessing."
arch=('x86' 'x86_64')
url="http://naspro.sourceforge.net/libraries.html#naspro-core"
license=("LGPL")
depends=()
sha1sums=("90a8381951dd4443c4c23dd5ba0ebbe25a350691")
source=("http://sourceforge.net/projects/naspro/files/naspro/$pkgver/naspro-core-$pkgver.tar.bz2")


build() {
	cd "$srcdir/naspro-core-$pkgver"
	#FIXME: deprecation of readdir_r, should be replaced with readdir
	#https://sourceware.org/bugzilla/show_bug.cgi?id=19056
	CFLAGS='-Wno-error' ./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/naspro-core-$pkgver"
	make DESTDIR="$pkgdir" install
}