# Maintainer: nullobsi <me at nullob dot si>
pkgname=beatoraja-modernchic
pkgver=0.8.5
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
sha256sums=('1e23fef219cf54abdec821a25c9699ad271ad79d8e156f3c691c9b653bad6032'
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
