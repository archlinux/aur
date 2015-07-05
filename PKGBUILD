# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=aldo
pkgver=0.7.7
pkgrel=2
pkgdesc="Morse code tutor with a random number generator & skill level testing"
arch=('i686' 'x86_64')
url="http://aldo.nongnu.org/"
license=('GPL')
depends=('libao' 'desktop-file-utils')
install=$pkgname.install
source=(http://savannah.nongnu.org/download/$pkgname/$pkgname-$pkgver.tar.bz2
	$pkgname.install
	$pkgname.desktop
	hamradio.png)

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=$pkgdir install                  

	mkdir -p $pkgdir/usr/share/$pkgname
	install -m644 README $pkgdir/usr/share/$pkgname/

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -m644 ../*.desktop $pkgdir/usr/share/applications/
	install -m644 ../hamradio.png $pkgdir/usr/share/pixmaps/
}
md5sums=('7baefd992953a0f4c56085af835495b1'
         'f7e1e2722c972f3420cfd69492c79073'
         'db0b42dd5494090f4382d854433eba06'
         'b24ce93a15cca693efa662ab90ae0fda')
sha256sums=('f1b8849d09267fff3c1f5122097d90fec261291f51b1e075f37fad8f1b7d9f92'
            'f703f8de14eb277dc72cc837086fbd55f5d772049a44200686c8ae76348f6614'
            '34db7c1c2ac1b2d5d434a4fbf8c6b87f62f7fe1e873b9b236c854fb4ff87962d'
            'e55aabbf91ad110672d87290582705a55c6a52bb5b487c7bd195f5e18cc550b3')
