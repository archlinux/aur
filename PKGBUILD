# Maintainer: ProfessorKaos64 <mdeguzis@gmail.com>
# Mod: http://www.moddb.com/mods/brutal-doom
pkgname=brutal-doom
pkgver=20
pkgrel=11
pkgdesc="Brutal Doom via the GzDoom engine."
arch=(any)
url="http://www.moddb.com/mods/brutal-doom"
license=('GPL3')
depends=('gzdoom')
optdepends=('doomseeker')
makedepends=('git')
source=('http://www.libregeek.org/Linux/game-files/brutal-doom/brutalv20b.pk3'
        'http://www.libregeek.org/Linux/game-files/brutal-doom/DoomMetalVol4.wad'
	'gzdoom.ini'
	'http://www.libregeek.org/Linux/game-files/brutal-doom/README.md'
	'http://www.libregeek.org/Linux/game-files/brutal-doom/manual.rtf'
	'brutal-doom'
	'brutal-doom.install'
	'brutal20patch.pk3'
)
noextract=(
	  'brutal20patch.pk3'
	  'brutalv20b.pk3'
	  )
sha512sums=('bbfdf854e248fcb4b21b1efd86130a501511313a68b50c8a3b9d4d6260d30bb8d4f91e3156a165878cb03b0544b30a27ef548538ee39675327c1c7be20285179'
            '8919ee9f38836b0e4793bc1dc028e39b3de670fc4a1960e280bd92847a5b5da8149bcf391a593f6d50162316ada0ef6372d7bd1eb8776046d8d746fe46b293ab'
            '2c09c6ef772fa170a21ba60720e31c64fff08aef848945810b3d16363df4176a6736d97d9e2f07b7956d10321e235a0c74cd7cb71d633842bcc7d23a6e0de5c9'
	    '3d3be93f3f65b205da5854459704e0b8ad037a38108dd42414c4c78010e5659056f56d6f4403b50f5b06ef70abc7fcf6dbb717e228298d9883461b156076800f'
	    '55d5f0ca86b55c4a47c86a5c9bd3a4071fedbbc0b3e486eda1c63211122eddaffcce188ff8875179a3656fbaa6aab7c78cc4e795ba8fe1d0ab0bd59d5585b97e'
	    '31a64315f2106654382f1a6b61ea05d455ed8911e4d053be0634316b6072e1cbd799294809303dba61347943a8252c3e52ff2803f5d36a82cdd922ad3fe1d3cc'
	    '7391e1702b89dae02f4321da4652d91b54525316deb57d2b20edfe60b0036783f4d9dc29169a38895ae2cf5dc2e5a8dc1b009dbb21d02c2061ba418ae567142e'
	    'd1efdac858c4a1364c207cc15877f759dace198d6205b3a4288bf694481b0f67734f4942f2417b9a96355ce0fe22dc51f2b9185443b9b86b5128d3a050f433d0'
	    )
install=$pkgname.install

package() {

	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/share/games/$pkgname"

	msg2 "Installing launcher"
	install -m755 "brutal-doom" "$pkgdir/usr/bin/brutal-doom"

	msg2 "Installing brutalv20b.pk3  and DoomMetalVol4.wad..."
	install -m644 "$srcdir/brutalv20b.pk3" "$pkgdir/usr/share/games/$pkgname/brutalv20b.pk3"
	install -m644 "$srcdir/DoomMetalVol4.wad" "$pkgdir/usr/share/games/$pkgname/DoomMetalVol4.wad"
	install -m644 "$srcdir/brutal20patch.pk3" "$pkgdir/usr/share/games/$pkgname/brutal20patch.pk3"
	install -m644 "$srcdir/manual.rtf" "$pkgdir/usr/share/games/$pkgname/manual.rtf"
	install -m644 "README.md" "$pkgdir/usr/share/games/$pkgname/README.md"

	msg2 "Installing configuration files..."
	install -m777 "gzdoom.ini" "$pkgdir/usr/share/games/$pkgname/gzdoom.ini"
}
