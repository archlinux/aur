# Maintainer: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=domination
pkgver=1.1.1.5
pkgrel=1
pkgdesc="A Java version of the classic Risk board game."
arch=('any')
url="http://domination.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=("http://prdownloads.sourceforge.net/$pkgname/Domination_$pkgver.zip"
		'Domination.sh'
		'domination.desktop')
md5sums=('9d439f0fc9a46d064713952d94d243cb'
		 'a19104a3bfe819bccfd97e617cb845a6'
		 '61fa92bdd98b03a74fb02e91aa4ac738')

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
