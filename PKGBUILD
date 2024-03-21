# Maintainer: Adiee5 <adiee5@adiee5.ct8.pl>
pkgname=prog8
pkgver=10.2.1
pkgrel=1
pkgdesc="A high-level programming language designed for 6502 based devices"
arch=("any")
url="https://github.com/irmen/prog8"
license=('GPL-3.0-only')
depends=("java-runtime-headless>=11" "tass64")
optdepends=("x16-emulator: emulating Commander x16"
	    "vice: Commodore 64 emulation"
#	    "box16: It doesn't look like box16 has an AUR package..."
#	    "vim: Editing prog8 code"
#	    "nano: Editing prog8 code"
	    )
source=("prog8c.jar::https://github.com/irmen/prog8/releases/download/v$pkgver/prog8compiler-$pkgver-all.jar"
	"p8compile"
	"prog8_detect.vim"
	"https://raw.githubusercontent.com/irmen/prog8/master/LICENSE"
	"https://raw.githubusercontent.com/irmen/prog8/master/syntax-files/nano/prog8.nanorc"
	"https://raw.githubusercontent.com/irmen/prog8/master/syntax-files/Vim/prog8.vim"
	"https://raw.githubusercontent.com/irmen/prog8/master/syntax-files/Vim/prog8_builtins.vim")
noextract=("prog8c.jar")
sha256sums=("8c2dcb08388d18b7e84b333b1ba30bd456465d2c40882c8a6690d8e80d14ad2b"
	    "c5b390a611ce778d8e22b6a2f626d273d424889c1ee7ce5454c66bce35aa888c"
	    "SKIP"
	    "SKIP"
	    "SKIP"
	    "SKIP"
	    "SKIP")

package() {
	install -Dm644 prog8c.jar "$pkgdir/usr/share/java/prog8/prog8c.jar"
	install -Dm755 p8compile "$pkgdir/usr/bin/p8compile"
	install -Dm755 p8compile "$pkgdir/usr/bin/prog8c"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 prog8.nanorc "$pkgdir/usr/share/nano/prog8.nanorc"
	install -Dm644 prog8_detect.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/prog8.vim"
	install -Dm644 prog8.vim "$pkgdir/usr/share/vim/vimfiles/syntax/prog8.vim"
	install -Dm644 prog8_builtins.vim "$pkgdir/usr/share/vim/vimfiles/syntax/prog8_builtins.vim"
	
}
