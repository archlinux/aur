# Maintainer: nullobsi <me at nullob dot si>
pkgname=beatoraja-modernchic
pkgver=0.8.3
pkgrel=1
pkgdesc="Cross-platform rhythm game based on Java and libGDX."
arch=('x86_64')
url="https://github.com/exch-bms2/beatoraja"
license=('GPL3' 'unknown')
groups=()
depends=('java-runtime-openjdk=8' 'java8-openjfx')
makedepends=()
install=
source=("https://mocha-repository.info/download/beatoraja${pkgver}-modernchic.zip" 'beatoraja.sh')
noextract=()
sha256sums=('a4296a7f243de5733d55d9fa5da7bc97df83d54f4c3f02a7d75030d1a2909b81'
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
