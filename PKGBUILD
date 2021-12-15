# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="thrive-launcher-bin"
pkgver="1.2.9"
pkgrel="1"
arch=("x86_64")
pkgdesc="Manages downloading Thrive releases."
url="https://revolutionarygamesstudio.com/"
source=("https://github.com/Revolutionary-Games/Thrive-Launcher/releases/download/v$pkgver/thrive-launcher_${pkgver}_amd64.deb" "https://raw.githubusercontent.com/Revolutionary-Games/Thrive-Launcher/master/LICENSE.md")
sha256sums=("769bd5a648e5da59cf1cd29597aee9c880d73d35f39a1e1bfb0454b60081f5f8" "cc1d44cfce6878a1c4bf3d0655ddc01166a4605e71cf8db48099aeaed320d932")
license=("GPL" "MIT")
depends=("gtk3" "nss" "lib32-glibc")
package() {
	bsdtar -C "$pkgdir" -xzf "$srcdir/data.tar.xz"
	mkdir -p "$pkgdir/usr/share/licenses/thrive-launcher-bin"
	cp LICENSE.md "$pkgdir/usr/share/licenses/thrive-launcher-bin/LICENSE"
	mkdir -p "$pkgdir/usr/bin"
	cd "$pkgdir"
	ln -rs ./opt/Thrive\ Launcher/thrive-launcher ./usr/bin
}
