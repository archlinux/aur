# Maintainer: Adiee5 <adiee5@adiee5.ct8.pl>
pkgname=prog8
pkgver=12.0
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
source=("prog8c-$pkgver.jar::https://github.com/irmen/prog8/releases/download/v$pkgver/prog8c-$pkgver-all.jar"
	"p8compile"
	"prog8_detect.vim"
	"https://raw.githubusercontent.com/irmen/prog8/master/LICENSE"
	"prog8-$pkgver-$pkgrel.nanorc::https://raw.githubusercontent.com/irmen/prog8/master/syntax-files/nano/prog8.nanorc"
	"prog8-$pkgver-$pkgrel.vim::https://raw.githubusercontent.com/irmen/prog8/master/syntax-files/Vim/prog8.vim"
	"prog8_builtins-$pkgver-$pkgrel.vim::https://raw.githubusercontent.com/irmen/prog8/master/syntax-files/Vim/prog8_builtins.vim"
	"prog8c_var_init")
noextract=("prog8c-$pkgver.jar")
sha256sums=("4ea4b7e86215223843bb4b598735e11997bba2f5c1c319b49242613f511bf909"
	    "c5b390a611ce778d8e22b6a2f626d273d424889c1ee7ce5454c66bce35aa888c"
	    "SKIP"
	    "SKIP"
	    "SKIP"
	    "SKIP"
	    "SKIP"
	    "SKIP")

package() {
	install -Dm644 $srcdir/prog8c-$pkgver.jar "$pkgdir/usr/share/java/prog8/prog8c.jar"
	install -Dm755 p8compile "$pkgdir/usr/bin/p8compile"
	install -Dm755 p8compile "$pkgdir/usr/bin/prog8c"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 prog8-$pkgver-$pkgrel.nanorc "$pkgdir/usr/share/nano/prog8.nanorc"
	install -Dm644 prog8_detect.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/prog8.vim"
	install -Dm644 prog8-$pkgver-$pkgrel.vim "$pkgdir/usr/share/vim/vimfiles/syntax/prog8.vim"
	install -Dm644 prog8_builtins-$pkgver-$pkgrel.vim "$pkgdir/usr/share/vim/vimfiles/syntax/prog8_builtins.vim"
	install -Dm644 prog8c_var_init "$pkgdir/etc/profile.d/prog8.sh"
}
