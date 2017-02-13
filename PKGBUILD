# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>

pkgname=hamsolar
pkgver=1.0
pkgrel=3
pkgdesc="Small desktop display of the current solar indices"
arch=('i686' 'x86_64')
url="http://hamsoftware.org/old_index.html"
license=('GPL')
depends=('qtwebkit' 'hamradio-menus')
source=(http://www.hamsoftware.org/$pkgname-$pkgver.tgz
             $pkgname.desktop
             $pkgname.png)

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	/usr/lib/qt4/bin/qmake
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm 755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname

	install -dm755 "${pkgdir}"/usr/share/doc/$pkgname
	install -m644 README.txt "${pkgdir}"/usr/share/doc/$pkgname

	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('f1aa47eec8c50166adc9de967f0f54bf'
         '101c1b24bd092666027bd9b22870c9e3'
         '71ae22b4607e5394cb1476d4c92ab46c')
sha256sums=('44e0797440a09899c62985833d9ed4e0968d6a4b7112ed22ce696ffc2fb0d802'
            'daf614290310b264d31956db586a00a90cf516c1377fb0baa3ac838a37dbe786'
            '4e890fabc1995f7d86038553fa3667967101d86d2b884b66b6695c795b849ec2')
