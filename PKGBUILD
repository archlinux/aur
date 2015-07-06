# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Emeric Grange <emeric.grange@gmail.com>
# Contributor: Matej Stuchlik <matej.stuchlik at gmail dot com>

pkgname=openrocket
pkgver=14.11
pkgrel=2
pkgdesc="A free and open source, fully featured model rocket simulator"
arch=('any')
url="http://openrocket.sourceforge.net/"
license=("GPL3")
depends=("java-environment" "desktop-file-utils")
install=$pkgname.install
source=(http://switch.dl.sourceforge.net/project/$pkgname/$pkgname/$pkgver/OpenRocket-$pkgver.jar
        $pkgname.1
	de_debian.tar.gz)
noextract=(OpenRocket-$pkgver.jar)

package() {
	cd $srcdir

	install -Dm644 OpenRocket-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
	install -Dm755 $pkgname.1 $pkgdir/usr/bin/$pkgname

	install -Dm644 de_debian/$pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
	find "$pkgdir/usr/share/man/man1" -name *.1 -exec gzip -9 {} +

	install -Dm644 de_debian/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 de_debian/$pkgname.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
}
md5sums=('407ad771e0eae29eddc28720362063e5'
         '54eb3c1641feb1eac7d4e4d9e912434a'
         'f8edc554065e121767355936727fc88a')
sha256sums=('8641bc5a348cd9330c24509e45523b7804ce5878173ce576c28c943cc101335f'
            '74ab605cb11161784d4af96d018eb88adf7a2e4a8b1088a64b94b1e8ec5e18d1'
            '62c4e739f82fa53fdae8a41f12bfb2828b77df89c8f48b1a790192a8e773cb98')
