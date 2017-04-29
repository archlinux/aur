# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=boinc_curses
pkgver=0.2.3
pkgrel=1
pkgdesc="console based boinc-client monitor and controller"
arch=('i686' 'x86_64')
url="http://www.oook.cz/bsd/boinc_curses/"
license=('GPL')
depends=(boinc)
source=(
	"http://www.oook.cz/bsd/$pkgname/$pkgname-$pkgver.tar.bz2"
	"str_replace.h"
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cp "$srcdir/str_replace.h" .
  make BOINC_HOME=/var/lib/boinc \
       BOINCINCDIR=/usr/include/boinc \
       BOINCLIBDIR=/usr/lib \
       CFLAGS=-I.
}

package() {
  install -D -m755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

sha512sums=('88fa2b332f659545b9ba57f90f223f27b3b8769fab7a085efe13e1339730706c718f2bb22e79d4f67bd89b8cbcdcc0348da297241e77d218b64839a9f9910d03'
            '4b35129b0f84c7e213ae454a141fc285749928b45462a9f58835923a5d98336715520b1b880e1c8e6cc8cb61169d0cdfbbe4713d0c0c786190b2909e300a3d09')
