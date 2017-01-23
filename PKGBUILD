# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Emeric Grange <emeric.grange@gmail.com>
# Contributor: Matej Stuchlik <matej.stuchlik at gmail dot com>

pkgname=openrocket
_pkgname=OpenRocket
pkgver=15.03
pkgrel=2
pkgdesc="A free and fully featured rocket flight simulator - 6 degrees of freedom"
arch=('any')
url=http://openrocket.info/
license=('GPL3')
depends=('java-environment' 'bash')
source=("https://github.com/$pkgname/$pkgname/releases/download/release-$pkgver/$_pkgname-15.03.jar"
        $pkgname.1
	de_debian.tar.gz)
noextract=($_pkgname-$pkgver.jar)

package() {
	cd $srcdir

	install -Dm644 OpenRocket-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
	install -Dm755 $pkgname.1 $pkgdir/usr/bin/$pkgname

	install -Dm644 de_debian/$pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
	find "$pkgdir/usr/share/man/man1" -name *.1 -exec gzip -9 {} +

	install -Dm644 de_debian/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 de_debian/$pkgname.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
}
md5sums=('a8fc9d5857505332bf987144c6c3f975'
         '54eb3c1641feb1eac7d4e4d9e912434a'
         'f8edc554065e121767355936727fc88a')
sha256sums=('2bbc4b1b57d99fd169f4119e221b934f007b88c437295f388a81cd3df5da84e3'
            '74ab605cb11161784d4af96d018eb88adf7a2e4a8b1088a64b94b1e8ec5e18d1'
            '62c4e739f82fa53fdae8a41f12bfb2828b77df89c8f48b1a790192a8e773cb98')
