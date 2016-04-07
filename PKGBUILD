# Maintainer: B.C. van Zuiden <zuiden@ilorentz.org>
pkgname=taarich
pkgver=1.20051120
pkgrel=1
arch=('any')
pkgdesc="Summary: Tells the Hebrew date, Torah readings, and generates calendars"
url="http://www.math.technion.ac.il/S/rl/calendar/gauss/"
license=('BSD')
source=("$pkgname-$pkgver.tar.gz")
md5sums=(ab10af06a4fc13378b0359d5083c7aac)

build() {
	cd "gauss-$pkgver"
	make
}

package() {
	cd "gauss-$pkgver"
    mkdir -p "$pkgdir/usr/share/man/man1/" 
    install -m 644 taarich.man "$pkgdir/usr/share/man/man1/taarich.1"
    install -m 644 luach.man "$pkgdir/usr/share/man/man1/luach.1"
    mkdir -p "$pkgdir/usr/bin"
    cp taarich "$pkgdir/usr/bin"
    cp luach "$pkgdir/usr/bin"
}
