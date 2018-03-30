# Maintainer: ProfessorKaos64 <mdeguzis@gmail.com>
# Mod: http://www.moddb.com/mods/brutal-doom
pkgname=brutal-doom
pkgver=21.2018.02.24
pkgrel=1
pkgdesc="Brutal Doom via the GzDoom engine."
arch=(any)
url="http://www.moddb.com/mods/brutal-doom"
license=('GPL3')
depends=('gzdoom')
optdepends=('doomseeker')
makedepends=('git')
source=(
		'http://packages.libregeek.org/game-files/brutal-doom/bd21testfeb24.pk3'
		'http://packages.libregeek.org/game-files/brutal-doom/DoomMetalVol4.wad'
        'http://packages.libregeek.org/game-files/brutal-doom/bd21-changelog.txt'
		'gzdoom.ini'
		'http://packages.libregeek.org/game-files/brutal-doom/README.md'
		'http://packages.libregeek.org/game-files/brutal-doom/manual.rtf'
		'brutal-doom'
		'brutal-doom.install'
		'brutal-doom.png'
		'brutal-doom.desktop'
)
noextract=('bd21testfeb24.pk3')
md5sums=(
			'd67380ac1a0af2e3094894d71625f9e5'
			'ce4e136fa6309327f17b9c828c69d843'
			'52dfc347e01afd80f80a7863ada729b1'
			'275d4b469d1305b72a9af0c0a15a0f1c'
			'd389f10370dfde975cb32e127385d237'
			'07ece7ee7141dc62b3253c7d1e200620'
			'e5097664c5be7b3895df588e086c6351'
			'f0b8b097b26db054cc1fd70c7c3d83e7'
			'bf85967c850adba3498cdba580a4e081'
			'3ab16e25014b173b5c9d09a4df2d167b'
	    )
install=$pkgname.install

package() {

	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/share/games/$pkgname"
	install -d "$pkgdir/usr/share/pixmaps"
	install -d "$pkgdir/usr/share/applications"

	msg2 "Installing launcher"
	install -m755 "brutal-doom" "$pkgdir/usr/bin/brutal-doom"

	msg2 "Installing bd21testfeb24.pk3 and DoomMetalVol4.wad..."
	install -m644 "$srcdir/bd21testfeb24.pk3" "$pkgdir/usr/share/games/$pkgname/bd21testfeb24.pk3"
	install -m644 "$srcdir/DoomMetalVol4.wad" "$pkgdir/usr/share/games/$pkgname/DoomMetalVol4.wad"
	install -m644 "$srcdir/manual.rtf" "$pkgdir/usr/share/games/$pkgname/manual.rtf"
	install -m644 "README.md" "$pkgdir/usr/share/games/$pkgname/README.md"
	install -m644 "$srcdir/brutal-doom.png" "$pkgdir/usr/share/pixmaps/brutal-doom.png"
	install -m644 "$srcdir/brutal-doom.desktop" "$pkgdir/usr/share/applications/brutal-doom.desktop"

	msg2 "Installing configuration files..."
	install -m777 "gzdoom.ini" "$pkgdir/usr/share/games/$pkgname/gzdoom.ini"
}
