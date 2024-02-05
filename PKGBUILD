pkgname=berusky-dos
pkgver=0.1.0
pkgrel=1
pkgdesc='Berušky (DOS verze)'
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
	SKIP{,,,,,,})
package(){
	install -dm757 "$pkgdir"/usr/share/$pkgname
	cp -r DOC MOD SMP BERUSKY.{CFG,DAT,EXE} {CWSDPMI,SETUP}.EXE FILE_ID.DIZ "$pkgdir"/usr/share/$pkgname
	cp urovne.bat "$pkgdir"/usr/share/$pkgname
	install *.LV3 read_me.txt -Dt "$pkgdir"/usr/share/$pkgname/urovne
	install berusky-{dos,edit}.png -Dt "$pkgdir"/usr/share/icons/hicolor/22x22/apps
	install -D {berusky-dos42,"$pkgdir"/usr/share/icons/hicolor/48x48/apps/berusky-dos}.png	# berusky.png koliduje s "berusky"
	install -D {berusky-edit42,"$pkgdir"/usr/share/icons/hicolor/48x48/apps/berusky-edit}.png
	install berusky-{dos,urovne}.desktop -Dt "$pkgdir"/usr/share/applications
}
