# Mantainer: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=domination
pkgver=1.1.1.7
pkgrel=1
pkgdesc="A Java version of the classic Risk board game."
arch=('any')
url="http://domination.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=("http://prdownloads.sourceforge.net/$pkgname/Domination_$pkgver.zip"
		'Domination.sh'
		'domination.desktop')
sha256sums=('0b66c65f137d5bdad2968af59b252acb1e94663d0b8bbda0d681746b7356d769'
            'f408672cdd5494732b95dad1db8db07a7c98d3fab5db7fa3925b0ebbe1b40e00'
		    'ebb1586de457c803449e46fa5b653452eb416241383d4ac4079b408d57d9eb49')

package() {
	install -d "$pkgdir/usr/share"
	cp -r "$srcdir/Domination" "$pkgdir/usr/share/"
	find $pkgdir -type d -exec chmod 755 {} \;
	find $pkgdir -type f -exec chmod 644 {} \;
	find $pkgdir -type f -name "*.sh" -exec chmod 755 {} \;
	install -D -m755 "$srcdir/Domination.sh" "$pkgdir/usr/bin/domination"
	install -D -m755 "$srcdir/domination.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m755 "$srcdir/Domination/resources/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
