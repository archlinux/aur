# Maintainer: Felix Mujkanovic <felix@cinecred.com>
pkgname=cinecred
pkgver=1.8.1
pkgrel=1
pkgdesc="Create beautiful film credits without the pain"
arch=('x86_64')
url="https://cinecred.com"
license=('GPL3')
source=("https://cinecred.com/dl/$pkgver/cinecred-$pkgver-linux-x86_64.tar.gz")
sha256sums=('0d79675613ba9582aef487f2ca8c2f7b2869080f20fb5c589b4bd31c1dfc322e')

package() {
	mkdir -p "$pkgdir/opt/"
	cp -r "$srcdir/cinecred/" "$pkgdir/opt/cinecred/"

	mkdir -p "$pkgdir/usr/share/applications/"
	mv "$pkgdir/opt/cinecred/cinecred.desktop" "$_"
	mkdir -p "$pkgdir/usr/share/metainfo/"
	mv "$pkgdir/opt/cinecred/cinecred.metainfo.xml" "$_"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	mv "$pkgdir/opt/cinecred/cinecred.svg" "$_"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
	mv "$pkgdir/opt/cinecred/cinecred.png" "$_"

	mkdir -p "$pkgdir/usr/bin/"
	ln -s /opt/cinecred/bin/cinecred "$_"
}
