# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname='battlescribe'
pkgver='2.00.17'
pkgrel=1
pkgdesc="An army list builder for table-top games."
arch=(any)
url="http://battlescribe.net/?tab=downloads"
_watch="$url"
license=('custom')

depends=('java-environment' 'bash')
source=("http://battlescribe.net/files/BattleScribe_$pkgver""_Multi.zip"
		"$pkgname.desktop"
		"$pkgname.png"
		'BattleScribe.sh')
md5sums=('6708b8185f6e9b61c82056efb1c2320e'
         '0d18577e61b1c6a90f3258905410b03b'
         'd0fef06c5b080003f84a0e148fbe9261'
         'cf0f2351b3241aa80cd80854fd73045f')

package() {
	cd "$srcdir"

	# Copy files to system
	install -D -t "$pkgdir/usr/share/java/$pkgname/" *.sh *.jar
	mv lib "$pkgdir/usr/share/java/$pkgname/"

	# Copy the licence
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.txt

	# Copy the desktop file and image
	install -Dm644 -t "$pkgdir/usr/share/applications/" *.desktop
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
