# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="thrive-launcher-bin"
pkgver="1.2.6"
pkgrel="1"
arch=("x86_64")
pkgdesc="Manages downloading Thrive releases."
url="https://revolutionarygamesstudio.com/"
source=("https://github.com/Revolutionary-Games/Thrive-Launcher/releases/download/v$pkgver/thrive-launcher_${pkgver}_amd64.deb" "https://raw.githubusercontent.com/Revolutionary-Games/Thrive-Launcher/master/LICENSE.md")
sha256sums=("a139a74ecec5a41a4bb8ddc8b1120face3695002a20831d5fa5c7ecf7bd7ae69" "c123d9ef3ea298ce75469ecf5c2b43e56ae33a7571ac4518fb4ee44c01523f1b")
license=("GPL" "MIT")
depends=("gtk3" "nss" "libxss" "lib32-glibc")
package() {
	bsdtar -C "$pkgdir" -xzf "$srcdir/data.tar.xz"
	mkdir -p "$pkgdir/usr/share/licenses/thrive-launcher-bin"
	cp LICENSE.md "$pkgdir/usr/share/licenses/thrive-launcher-bin/LICENSE"
	mkdir -p "$pkgdir/usr/bin"
	cd "$pkgdir"
	ln -rs ./opt/Thrive\ Launcher/thrive-launcher ./usr/bin
}
