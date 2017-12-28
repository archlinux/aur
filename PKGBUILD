# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Filip <fila pruda com>
pkgname=ytd
pkgver=1.59
pkgrel=3
pkgdesc='An utility for downloading multimedia content from YouTube and other online streaming services.'
arch=('i686' 'x86_64')
url='http://www.pepak.net/ytd/ytd/'
license=('BSD')
depends=('wine' 'wine-mono' 'wine_gecko')
makedepends=()
source=(
	"$pkgname"
	"$pkgname.desktop"
	"$pkgname.png"
	"$pkgname.xml"
	"http://www.pepak.net/files/youtube/$pkgname-$pkgver.zip"
	)
md5sums=(
	'cac6d1373933442fe3e5643d45775ea3'
	'2689ee73eaf3abbe601c926cb69a3725'
	'c2d33f588cf2db34c04afcf8dbc4ea9e'
	'fce75f73f298761474a9634fbe483734'
	'e0997b348138215f218c6351a2f6729d'
	)

package() {
	# bin
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

	# app
	install -d -m755 "$pkgdir/usr/share/$pkgname/"
	install -d -m755 "$pkgdir/usr/share/$pkgname/locale/"
	install -m644 "$pkgname.exe" "$pkgname-defs.xml" "$pkgname.xml" "$pkgdir/usr/share/$pkgname"
	cp -r locale/. "$pkgdir/usr/share/$pkgname/locale/"

	# desktop
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/icons/$pkgname.png"

	# docs
	install -d -m755 "$pkgdir/usr/share/doc/$pkgname/"
	install -m644 doc/*.txt "$pkgdir/usr/share/doc/$pkgname/"
}
