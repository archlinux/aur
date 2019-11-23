# Maintainer: Neil Simpson <neilsimp1@gmail.com>

pkgname=netrunner-bin
pkgver=2.0b18
pkgrel=1
pkgdesc="NetRunner is a telnet client originally developed in the late 90s in sync with the release of Windows XP. It was intended to be a console telnet client which stayed true to ANSI-BBS emulation and the old school feel of DOS terminals. Some features include batch upload/download Zmodem and Zmodem 8K, multiple phone book, mTelnet and SyncTerm phone book importers, original MSDOS and Amiga fonts with font switching, full screen mode, basic scripting language, mouse support, and font UPSCALING that (when enabled) provides the highest quality BBS terminal, even at 2K full screen resolutions! The current release is version 2.0 Beta 18 which is based on the SDL2 graphics engine, providing the most accurate and highest quality ANSI-BBS experience. Optimiziations for CPU usage and speed are still on-going for the beta cycle amd improvements should be seen as versions progress."
arch=("i686" "x86_64")
url="http://www.mysticbbs.com/"
license=("unknown")
depends=("sdl")
makedepends=("unrar")
install="$pkgname.install"
source_i686=("http://www.mysticbbs.com/downloads/nr20b18l.rar")
source_x86_64=("http://www.mysticbbs.com/downloads/nr20b186.rar")
source=("netrunner.sh" "netrunner.desktop")
noextract=("nr20b18l.rar" "nr20b186.rar")
sha256sums_i686=("155e69f98d8f394365cc890d07ddc981be80eaa4a1b171cc133dac21e16b7838")
sha256sums_x86_64=("a76bd19bfe97f708242985595f17fd1d16d7e3ca19fd4f0ea5f1256f48f97abb")
sha256sums=("0bb2148b98f647aa7d49ef7ac17cf01817f0c5c322b20c19d736bb4812edc21d"
	"0f570f105afad92b27d31c5a0cd7bc58bc8a7bdaba7f726c4ba06a1591484e99")

prepare() {
	[ "$CARCH" = "i686" ] && unrar x nr20b18l.rar
	[ "$CARCH" = "x86_64" ] && unrar x nr20b186.rar
}

package() {
	cd "$srcdir/"

	install -Dm 755 netrunner.sh "$pkgdir"/usr/bin/netrunner
	install -Dm 644 netrunner.desktop "$pkgdir"/usr/share/applications/netrunner.desktop

	install -Dm 755 file_id.diz "$pkgdir"/usr/share/netrunner/file_id.diz
	install -Dm 755 netrunner "$pkgdir"/usr/share/netrunner/netrunner
	install -Dm 755 netrunner.icn "$pkgdir"/usr/share/netrunner/netrunner.icn
	install -Dm 755 netrunner.manual.txt "$pkgdir"/usr/share/netrunner/netrunner.manual.txt
	install -Dm 755 test.scr "$pkgdir"/usr/share/netrunner/test.scr
	install -Dm 755 whatsnew.txt "$pkgdir"/usr/share/netrunner/whatsnew.txt
}
