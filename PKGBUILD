# Maintainer: Felix Mujkanovic <felix@cinecred.com>
pkgname=cinecred
pkgver=1.4.1
pkgrel=1
pkgdesc="Create beautiful film credits without the pain"
arch=('x86_64')
url="https://cinecred.com"
license=('GPL3')
source=("https://repo.loadingbyte.com/repository/maven-releases/com/loadingbyte/cinecred\
/$pkgver/cinecred-$pkgver-linux-x86_64.tar.gz")
sha256sums=('af48d5e5ff5058e91807b19bbc0c0c2dad377115f7ad963eff4ea1d1f1daad1c')

package() {
	mkdir -p "$pkgdir/opt/"
	cp -r "$srcdir/cinecred/" "$pkgdir/opt/cinecred/"

	mkdir -p "$pkgdir/usr/share/applications/"
	mv "$pkgdir/opt/cinecred/cinecred.desktop" "$_"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	mv "$pkgdir/opt/cinecred/cinecred.svg" "$_"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	mv "$pkgdir/opt/cinecred/cinecred.png" "$_"

	mkdir -p "$pkgdir/usr/bin/"
	ln -s /opt/cinecred/bin/cinecred "$_"
}
