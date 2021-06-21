# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="thrive-launcher-bin"
pkgver="1.2.8"
pkgrel="1"
arch=("x86_64")
pkgdesc="Manages downloading Thrive releases."
url="https://revolutionarygamesstudio.com/"
source=("https://github.com/Revolutionary-Games/Thrive-Launcher/releases/download/v$pkgver/thrive-launcher_${pkgver}_amd64.deb" "https://raw.githubusercontent.com/Revolutionary-Games/Thrive-Launcher/master/LICENSE.md")
sha256sums=("20d469262b5a99979769f84a71fcf304b72b4f2293760b610d85f377be1cbe0b" "c123d9ef3ea298ce75469ecf5c2b43e56ae33a7571ac4518fb4ee44c01523f1b")
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
