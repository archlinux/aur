# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-gui-bin
_pkgname=ferium-gui
pkgver=3.28.7
pkgrel=1
pkgdesc="Ferium is an easy to use CLI program for downloading and updating Minecraft mods from Modrinth, CurseForge, and GitHub Releases."
arch=("x86_64")
depends=("gtk3")
provides=("ferium")
conflicts=("ferium-bin")
url="https://github.com/theRookieCoder/ferium"
license=('MPL2')
source=("$_pkgname-$pkgver-$pkgrel.zip::https://github.com/theRookieCoder/ferium/releases/download/v$pkgver/ferium-linux-gnu.zip"
	"ferium.desktop")
sha256sums=('9ab8fe6160727e2a9c642bf16d7159233930915e24ca718adfd004d8a8aa73b0'
            '594cdfb846ab9cbac0fd781a445501ebb1e3f491fd21202bf3733b00f2151018')

package() {
	cd "$srcdir"
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium" 

	install -Dm644 -t "$pkgdir/usr/share/applications" ferium.desktop
}
