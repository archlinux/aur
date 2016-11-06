# Maintainer: ProfessorKaos64 <mdeguzis@gmail.com>
# Mod: http://www.moddb.com/mods/brutal-doom-64/
pkgname=brutal-doom-64
pkgver=1c
pkgrel=1
pkgdesc="Brutal Doom 64 via the GzDoom engine."
arch=(any)
url="http://www.moddb.com/mods/brutal-doom-64"
license=('GPL3')
depends=('gzdoom')
optdepends=('doomseeker')
makedepends=('git')
source=(
	'http://libregeek.org/Linux/game-files/brutal-doom-64/bd64gameV1c.pk3'
	'http://libregeek.org/Linux/game-files/brutal-doom-64/bd64mapsV1c.pk3'
	'http://libregeek.org/Linux/game-files/brutal-doom-64/ZD64MUSIC.pk3'
	'brutal-doom-64.desktop'
	'brutal-doom-64.png'
	'brutal-doom-64'
	'gzdoom.ini'
	'brutal-doom-64.install'
	)
sha512sums=(
	    '53fb54d5e51a34a20d2600570c0a5768635c2e7ded2de141d744938a365a95f2d83a98cb8b1f72002d08385d33e4ab0cd67bca8473532e57b5ac5ec4ab833baf'
	    '4f370a780c766c634f5e513b72514afbcb102e9c6c324e60b541cb8cc7a63001710ec923b7c7417205fb60188ffadcf493b38dde918c6d80a294419e1b656e28'
	    '788a50c809b20b4efba8934a205f58b300cfe5f55f7fcc155ef25d3dffd1b9152870ab81eab4bed879f6e9d5b3180dd0355afa85cd0202421f1d847f1b3006cc'
	    '119ec2e43ab2b1efc0f0b8c863711915d60244ee720dd29eb63d8fa7f3bc30112c1488408bea7cc7d3fe41f51f26863eb174d5255f1ba3cb93ace0941cb490cc'
	    '635b036147551000ef4354c299441ec9658dc62aa5df457a680bb2b6eb2975cb69a913ea54cb12e7960141447928c7a351cba2235b082bfdeacc20d27e47724a'
	    '64f0687d392e2369138436b71b580456083023b63aad75b29355e08e75e23dc3d4f5f828d84e6f0e2243de913310fb86f3bfa4dd4d80c2de6bba98bc04c00e20'
	    '9bdf99bd0f02e5bb9416913c12daf1ed9e515cb515bce198a0c205f944b2280aec2055e58dda2370643021251f8addfc73f17d9f64acffc6dafdeedd618be868'
	    '4877760b32c4a8296091427a0ef7905958381647d7477ee3e11825e8a3c86b9315df546f61f610ecb073853b5e76970d50e83ef1267f26099f3d376c4c4556cb'
	    )
install=$pkgname.install

package() {

	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/share/games/$pkgname"
	install -d "$pkgdir/usr/share/applications"
	install -d "$pkgdir/usr/share/pixmaps"

	msg2 "Installing launcher"
	install -m755 "brutal-doom-64" "$pkgdir/usr/bin/brutal-doom-64"

	msg2 "Installing WADs / PK3 files"
	install -m644 "$srcdir/bd64gameV1c.pk3" "$pkgdir/usr/share/games/$pkgname/bd64gameV1c.pk3"
	install -m644 "$srcdir/bd64mapsV1c.pk3" "$pkgdir/usr/share/games/$pkgname/bd64mapsV1c.pk3"
	install -m644 "$srcdir/ZD64MUSIC.pk3" "$pkgdir/usr/share/games/$pkgname/ZD64MUSIC.PK3"

	msg2 "Installing configuration files and other extras"
	install -m777 "brutal-doom-64.desktop" "$pkgdir/usr/share/applications/brutal-doom-64.desktop"
	install -m777 "brutal-doom-64.png" "$pkgdir/usr/share/pixmaps/brutal-doom-64.png"
	install -m777 "gzdoom.ini" "$pkgdir/usr/share/games/$pkgname/gzdoom.ini"
}
