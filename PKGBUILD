pkgname=jazz2-bin
pkgver=autoupdates
pkgrel=1
pkgdesc="Jazz² Resurrection: Open-source Jazz Jackrabbit 2 reimplementation (release or nightly channel)"
arch=(x86_64 aarch64)
url=http://deat.tk/jazz2/
license=(GPL3 MIT/Expat)
depends=(libopenmpt openal sdl2 zenity)
install=jazz2.install
source=(
	https://archive.org/download/j2r_demo/Games.zip
	https://github.com/deathkiller/jazz2-native/raw/master/Sources/Icons/32px.png
	jazz2{,.desktop})
md5sums=(
	b5095a5ba6d2d7d20b2c4ff2a99301c5
	5adcc9de4dac2c9b5456494a5573ea94
	66e2fcda066b90cc842bdf695b763964
	665ca003a5ff9eb51ce0fc4e23dd2ae9)
package(){
	install jazz2 -Dt "$pkgdir"/usr/bin
	install "Games/Jazz2 Secret Files Demo/"* -Dt "$pkgdir/usr/share/Jazz² Resurrection/Source"
	cp -r Games/Jazz2Sw/* "$pkgdir/usr/share/Jazz² Resurrection"
	install -D {32px,"$pkgdir"/usr/share/pixmaps/jazz2}.png
	install jazz2.desktop -Dt "$pkgdir"/usr/share/applications
	sed '/^Name=/s/$/ (Update)/;/^Exec=/s/$/ update/' jazz2.desktop>"$pkgdir"/usr/share/applications/jazz2-update.desktop
}
