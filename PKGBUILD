# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-bin
_pkgname=ferium
pkgver=3.22.1
pkgrel=1
pkgdesc="Ferium is an easy to use CLI program for downloading and updating Minecraft mods from Modrinth, CurseForge, and GitHub Releases."
arch=("x86_64")
provides=("ferium")
conflicts=("ferium-gui-bin")
url="https://github.com/theRookieCoder/ferium"
license=('MPL2')
source=("$_pkgname-$pkgver-$pkgrel.zip::https://github.com/theRookieCoder/ferium/releases/download/v$pkgver/ferium-linux-gnu-nogui.zip"
	"ferium.desktop")
sha256sums=('f661263e55aa8204745c889ca34c7406931fd2e26c7e705f9aef02eb63e1881e'
            '594cdfb846ab9cbac0fd781a445501ebb1e3f491fd21202bf3733b00f2151018')

package() {
	cd "$srcdir"
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium" 

	install -Dm644 -t "$pkgdir/usr/share/applications" ferium.desktop
}
