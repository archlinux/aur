# Maintainer: ProfessorKaos64 <mdeguzis@gmail.com>
# Mod: http://www.moddb.com/mods/brutal-doom
pkgname=brutal-doom
pkgver=20
pkgrel=2
pkgdesc="Brutal Doom via the GzDoom engine."
arch=(any)
url="http://www.moddb.com/mods/brutal-doom"
license=('GPL3')
depends=('gzdoom')
optdepends=('doomseeker')
makedepends=('git')
source=('http://www.moddb.com/downloads/mirror/95667/114/faa37e9cb128f86a92d71ee5db227e89'
        'http://www.moddb.com/downloads/mirror/61238/114/5f4c5b91df555944d115f983c8d65698'
	'gzdoom.ini'
	'README.md')
sha512sums=('ba37b0c3a2837130d1d6bf7e9ad12ad8eb3d82a8f1abb316083550cb1811199267b4b301fcc13855b3dcb6334f57dd033b4f0bcd9af39731d9bfd7d5dcedfd4a'
            'b1180910025e8b8f065c56518fb1556678ef5c6062dc527e1f3e54dfa039e82f8e49bb1997ccf06a07e451576fbe35c321773eb7dbb7f62b1654b59cb9e07f32'
            'dca96917524cf7ea8c3e40ca493977d82b534dfd734b6b8b5a1e12b36a3e59a5c56766ba33049c906aaa513545a205c91ec6ceb33cb3ac80f80f5165a8d35a06'
	    '3d3be93f3f65b205da5854459704e0b8ad037a38108dd42414c4c78010e5659056f56d6f4403b50f5b06ef70abc7fcf6dbb717e228298d9883461b156076800f')

install=$pkgname.install

package() {
	install -d "$pkgdir/brutal-doom/usr/share/games/$pkgname"
	msg2 "Installing brutalv20b.pk3  and DoomMetalVol4.wad..."
	install -Dm644 "$srcdir/brutalv20b.pk3" "$pkgdir/usr/share/games/$pkgname/brutalv20b.pk3 "
	install -Dm644 "$srcdir/DoomMetalVol4.wad" "$pkgdir/usr/share/games/$pkgname/DoomMetalVol4.wad"
	install -Dm644 "$srcdir/manual.rtf" "$pkgdir/usr/share/games/$pkgname/manual.rtf"
	install -Dm644 "README.md" "$pkgdir/usr/share/games/$pkgname/README.md"

	msg2 "Installing configuration files..."
	install -Dm644 "gzdoom.ini" "$pkgdir/usr/share/games/$pkgname/gzdoom.ini"
}
