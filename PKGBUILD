# Maintainer: koh11235813 <koh11235813 at gmail dot com>
# Contributor: nullobsi <me at nullob dot si>
pkgname=beatoraja-modernchic
pkgver=0.8.8
pkgrel=1
pkgdesc="Cross-platform rhythm game based on Java and libGDX."
arch=('x86_64')
url="https://github.com/exch-bms2/beatoraja"
license=('GPL3' 'unknown')
groups=()
optdepends=('mesa: for OpenGL support (recommended)')
depends=('xorg-xrandr' 'jre21-openjdk' 'java21-openjfx')
makedepends=()
install=
source=("https://mocha-repository.info/download/beatoraja${pkgver}-modernchic.zip" 'beatoraja.sh' 'beatoraja.desktop')
noextract=()
sha256sums=('c89c2890e95d34251dbcfb57ab2d4e2f61121a9e38ebf6990507af7ad1a5a7b4'
            'e71a8db5b93b768b04dc558e0b4478bf2edcaf890fd424873a7a0f760f0ee06b'
            'de5e7ec93e501d139502d7433fcc67e1c305b8dc10c25edf362178274808f773')

build() {
	cd "$srcdir/beatoraja${pkgver}-modernchic"
	rm beatoraja-config.bat
	rm beatoraja-config.command
	rm jportaudio_x64.dll
	rm portaudio_x64.dll
}

package() {
	cd "$srcdir/"
	mkdir "$pkgdir/opt"
	cp -r "beatoraja${pkgver}-modernchic" "$pkgdir/opt/beatoraja"
	chmod -R 777 "$pkgdir/opt/beatoraja"
	install -Dm777 beatoraja.sh "$pkgdir/usr/bin/beatoraja"
	install -Dm644 beatoraja.desktop "$pkgdir/usr/share/applications/beatoraja.desktop"
}
