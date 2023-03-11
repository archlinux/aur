# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=dargui
pkgver=1.3
pkgrel=1
pkgdesc="Graphical frontend for dar"
url="http://dargui.sourceforge.net"
arch=('x86_64')
license=('GPL')
depends=('dar')
source=("http://downloads.sourceforge.net/project/dargui/dargui/${pkgver}/dargui-${pkgver}-bin.tar.gz")
sha1sums=('409c11f1a04fabba5ece305035a9eac3996dee54')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -d -m 755 "$pkgdir/usr/share/dargui/locales"
	install -d -m 755 "$pkgdir/usr/share/doc/dargui"
	cp -R doc/* "$pkgdir/usr/share/doc/dargui"
	find "$pkgdir/usr/share/doc/dargui" -type d -exec chmod 755 {} \;
	find "$pkgdir/usr/share/doc/dargui" -type f -exec chmod 644 {} \;
	install -D -m644 "man/dargui.1.gz" "$pkgdir/usr/share/man/man1/dargui.1.gz"
	install -D -m644 "menu/dargui" "$pkgdir/usr/share/menu/dargui"
	install -D -m644 "applications/dargui.desktop" "$pkgdir/usr/share/applications/dargui.desktop"
	install -D -m644 "pixmaps/dargui.png" "$pkgdir/usr/share/pixmaps/dargui.png"
	install -m755 scripts/* "$pkgdir/usr/share/dargui"
	install -m644 locales/* "$pkgdir/usr/share/dargui/locales"
	install -D -m644 "README" "$pkgdir/usr/share/doc/dargui/README"
	install -D -m755 "dargui" "$pkgdir/usr/bin/dargui"
}
