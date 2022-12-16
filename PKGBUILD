pkgname=berusky-dos
pkgver=v0.1.0
pkgrel=1
pkgdesc="Berušky (DOS verze)"
arch=(any)
url=https://www.anakreon.cz/Berusky.html
license=(GPL)
depends=(dosbox)
install=$pkgname.install
source=(
	https://www.anakreon.cz/download/{berusky,urovne}.zip
	urovne.bat
	berusky-{dos,edit}{,42}.png
	berusky-{dos,urovne}.desktop)
md5sums=(
	279e2837172a38b61fd88da4795c56d7
	da887f103f5a527cece2ed535a3d5959
	221cbc448bd6c8f0869b3048d31608d9
	236227c3769167178975223328b02b82
	40c20f0cb4b189960f9a0ef6b80d11e6
	664d63159015b84234425aa67a02d605
	3b311f67e9d3c12a868b5a4d17479af5
	00fb3d23e038e6edf24f5e2e6dcfa709
	9df885fc6e5b0a6c0f2af9bf396732e9)
package(){
	install -dm757 "$pkgdir"/usr/share/$pkgname
	cp -r DOC MOD SMP BERUSKY.{CFG,DAT,EXE} {CWSDPMI,SETUP}.EXE FILE_ID.DIZ ../urovne.bat "$pkgdir"/usr/share/$pkgname
	install *.LV3 read_me.txt -Dt "$pkgdir"/usr/share/$pkgname/urovne
	install berusky-{dos,edit}.png -Dt "$pkgdir"/usr/share/icons/hicolor/22x22/apps
	install -D {berusky-dos42,"$pkgdir"/usr/share/icons/hicolor/48x48/apps/berusky-dos}.png	# berusky.png koliduje s "berusky"
	install -D {berusky-edit42,"$pkgdir"/usr/share/icons/hicolor/48x48/apps/berusky-edit}.png
	install berusky-{dos,urovne}.desktop -Dt "$pkgdir"/usr/share/applications
}
