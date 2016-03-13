# Maintainer: Bjarno Oeyen <aur _AT_ bjarno _DOT_ be>

pkgname=game-jolt-client
pkgrel=1
pkgver=0.3.2
pkgdesc="Play games. Make games. Stay indie."
url="http://gamejolt.com/client"
provides=('game-jolt-client')
arch=('x86_64')
license=('mit')
depends=('gtk2' 'alsa-lib' 'libnotify' 'gconf' 'nss' 'libxtst' 'nodejs')
makedepends=()
backup=()
install=''
source=("https://n3b6p5n5.ssl.hwcdn.net/data/client/releases/v0.3.2/game-jolt-client.tar.gz")
md5sums=('2768d72a2b82f38916afce0496414886')
options=(!strip)

package() {
	install -d "$pkgdir"/opt
	cp -R "$srcdir" "$pkgdir"/opt/game-jolt-client

	find "$pkgdir"/opt/game-jolt-client/ -type f -exec chmod 644 {} \;
	chmod 755 "$pkgdir"/opt/game-jolt-client/game-jolt-client

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/game-jolt-client/game-jolt-client "$pkgdir"/usr/bin/game-jolt-client

	install -Dm644 "../APPLICENSE"               "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "../game-jolt-client.desktop" "${pkgdir}/usr/share/applications/game-jolt-client.desktop"
	install -Dm644 "../game-jolt.png"            "${pkgdir}/usr/share/pixmaps/game-jolt.png"
	install -Dm644 "../package.json.new"         "${pkgdir}/opt/game-jolt-client/package.json"
}