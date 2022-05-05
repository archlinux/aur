# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-gui-bin
_pkgname=ferium-gui
pkgver=3.25.1
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
sha256sums=('81d94575224c6838323e5d92f15e9101af602d27ddd21da3c96d4cd9705f8dbd'
            '594cdfb846ab9cbac0fd781a445501ebb1e3f491fd21202bf3733b00f2151018')

package() {
	cd "$srcdir"
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium" 

	install -Dm644 -t "$pkgdir/usr/share/applications" ferium.desktop
}
