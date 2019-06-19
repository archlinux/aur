# Maintainer: Zanny <lordzanny@gmail.com>
# Maintainer: ProfessorKaos64 <mdeguzis@gmail.com>

pkgname=brutal-doom
pkgver=21
pkgrel=2
pkgdesc="Brutal Doom via the GzDoom engine."
arch=(any)
url="http://www.moddb.com/mods/brutal-doom"
license=('GPL3')
depends=('gzdoom')
optdepends=('doomseeker')
makedepends=('git')
source=(
		'http://doomshack.org/uploads/brutalv21.7z'
		'https://static.allfearthesentinel.net/wads/doommetalvol5.wad'
		'brutal-doom'
		'gzdoom.ini'
		'brutal-doom.png'
		'brutal-doom.desktop'
)
noextract=('brutalv21.pk3')
sha1sums=(
			'3260fccd428d9b8e9327e36978f80dc48fe31000'
			'de01ec06563a442ed04649f5062cd1b61cfc1917'
			'0255b97eb04619e43d65774eaccc257863ecdb36'
			'8207776f36fd46a0ee85b72b047e79484e2079f3'
			'0259b3c20a2749f28c8add5cd55755c51bd2cef6'
			'1f9e71edef0131d24f0aced422ba7b7cb8573a1c'
	    )

package() {
    cd $srcdir

	install -Dm644 "brutalv21.pk3" "$pkgdir/usr/share/games/$pkgname/brutal-doom.pk3"
	install -m644 "doommetalvol5.wad" "$pkgdir/usr/share/games/$pkgname/doom-metal.wad"
    install -m644 "gzdoom.ini" "$pkgdir/usr/share/games/$pkgname/gzdoom.ini"

	install -Dm644 "BRUTAL DOOM MANUAL.rtf" "$pkgdir/usr/share/doc/$pkgname/manual.rtf"
	install -m644 "bd21 changelog.txt" "$pkgdir/usr/share/doc/$pkgname/changelog.txt"

	install -Dm644 "brutal-doom.png" "$pkgdir/usr/share/pixmaps/brutal-doom.png"
	install -Dm644 "brutal-doom.desktop" "$pkgdir/usr/share/applications/brutal-doom.desktop"
	
    install -Dm755 "brutal-doom" "$pkgdir/usr/bin/brutal-doom"
}
