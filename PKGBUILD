# Contributor: henning mueller <henning@orgizm.net>
# Original sdlpong by http://sourceforge.net/projects/uninspiredsoft

pkgname=schaeublepong
pkgver=0.3
pkgrel=3
pkgdesc="sdlpong with Wolfgang Schäuble theme used on CCC Bremen partys."
arch=(i686 x86_64)
license=(GPL)
url=http://ccchb.de/wiki/Sch%C3%A4uble-Pong
depends=(sdl sdl_image)
source=(http://arsch.orgizm.net/source/schaeuble-sdlpong-0.3.tar.gz)
md5sums=(dff47860f9b4a0ef28a4428809369ff3)

build() {
	cd $srcdir/sdlpong*
	./configure || return 1
	make || return 1

	install -D -m755 sdlpong $pkgdir/usr/share/schaeublepong/sdlpong
	cp -r gfx $pkgdir/usr/share/schaeublepong

	mkdir -p $pkgdir/usr/bin
	echo -ne "#!/bin/sh\ncd /usr/share/schaeublepong\n./sdlpong \$@" > $pkgdir/usr/bin/schaeublepong
	chmod 755 $pkgdir/usr/bin/schaeublepong
}
