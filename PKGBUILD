# Maintainer: nullobsi <me at nullob dot si>
pkgname=beatoraja-modernchic
pkgver=0.8.4
pkgrel=1
pkgdesc="Cross-platform rhythm game based on Java and libGDX."
arch=('x86_64')
url="https://github.com/exch-bms2/beatoraja"
license=('GPL3' 'unknown')
groups=()
optdepends=('java8-openjfx: JFX when not using official binary')
depends=('java-runtime-openjdk=8')
makedepends=()
install=
source=("https://mocha-repository.info/download/beatoraja${pkgver}-modernchic.zip" 'beatoraja.sh')
noextract=()
sha256sums=('2ad9c5b04d970eb4d2d3ddf935785a8701adbd8379f86e396ab30a5e2810bf6e'
            'e3ecfadd046942b8e1bbf686e6d5e0573cc312b6d463f45b2940056cf4239f78')

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
	install -D beatoraja.sh "$pkgdir/usr/bin/beatoraja"
}
