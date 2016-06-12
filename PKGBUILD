# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname='battlescribe'
pkgver='1.15.07'
pkgrel=1
pkgdesc="An army list builder for table-top games."
arch=(any)
url="http://battlescribe.net/"
license=('custom')

depends=('java-environment' 'bash')
source=("http://files.battlescribe.net/BattleScribe_$pkgver""_Multi.zip"
		"$pkgname.desktop"
		"$pkgname.png"
		'BattleScribe.sh')
md5sums=('1104d01254a217e0472b13fbb7af612f'
         'c971a70893a6960006d290a15a44af48'
         'd0fef06c5b080003f84a0e148fbe9261'
         'c344ad9eddc6d1a13249c4a238826c1d')

package() {
	cd "$srcdir"

	# Copy files to system
	install -D -t "$pkgdir/opt/$pkgname/" *.sh *.jar
	mv lib "$pkgdir/opt/$pkgname/"

	# Copy the licence
	mv license.txt LICENSE
	install -Dm644 -t "$pkgdir/usr/share/licenses/battlescribe/" LICENSE

	# Copy the desktop file and image
	install -Dm644 -t "$pkgdir/usr/share/applications/" *.desktop
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
