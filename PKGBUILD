# Maintainer: FzerorubigD <fzerorubigd {AT} Gmail {Dot} Com

pkgname=gamine
pkgver=1.1
pkgrel=2
pkgdesc="Gamine is a game designed for 2 years old children who are not able to use mouse and keyboard."
url="http://www.gnunux.info/dotclear2/index.php?post/2007/11/25/236"
arch=('any')
license=('GPL3')
depends=('gstreamer0.10' 'cairo' 'gconf')
source=(
        https://github.com/btong/gamine/archive/gamine-$pkgver.tar.gz
        makefile.patch
)
md5sums=('47eb1db9ce5592a66340025457b395af'
         '14a16efe7672dec89c8f074e78512a97')

package() {
	cd $srcdir
	cd gamine-gamine-${pkgver}
        patch -Np0 -i $srcdir/makefile.patch
	make PREFIX=/usr sysconfdir=/etc/
	mkdir $pkgdir/usr
	mkdir $pkgdir/etc
	make install PREFIX=$pkgdir/usr sysconfdir=$pkgdir/etc/
	mkdir $pkgdir/usr/share/pixmaps
	cp $pkgdir/usr/share/gamine/gamine.png $pkgdir/usr/share/pixmaps
}
