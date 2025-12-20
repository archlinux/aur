# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh <skipper13@root.ua> aka UR6LAD
# Original Submitter: Bob Finch <w9ya@qrpqrci.net>

pkgname=dxcc
pkgver=20191204
pkgrel=2
pkgdesc="Ham Radio - Determines ARRL DX entity of a callsign"
arch=('any')
url="http://fkurz.net/ham/dxcc.html"
license=('GPL-2.0-only')
depends=('cty' 'perl-tk')
source=(http://fkurz.net/ham/$pkgname/$pkgname-$pkgver.tar.gz
        dxcc.desktop)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	sed -i s:'/usr/share/dxcc/cty.dat':'/usr/share/cty/cty.dat': dxcc
}

package() {
	cd $srcdir/$pkgname-$pkgver

	mkdir -p $pkgdir/usr/bin || return 1
	make DESTDIR=$pkgdir/usr install

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -m644 ../$pkgname.desktop $pkgdir/usr/share/applications
	install -m644 *.png $pkgdir/usr/share/pixmaps
}
md5sums=('eec8de4c7cc81172684510c21fb28451'
         '66087dabafc0b72824037b136f6e53ed')
sha256sums=('03e9036137b00f2b683e2f18a46e4422754fc3f1aa72807b42e0d9eaa0d0f288'
            '325123ed9c391d95c73bf7a8bd13dec3a4aa3395a403db1d8b5b5a9f3960cbb4')
