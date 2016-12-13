# Maintainer: ProfessorKaos64 <mdeguzis@gmail.com>
# Mod: http://www.moddb.com/mods/brutal-doom-64/
pkgname=brutal-doom-64
pkgver=2.0
pkgrel=3
pkgdesc="Brutal Doom 64 via the GzDoom engine."
arch=(any)
url="http://www.moddb.com/mods/brutal-doom-64"
license=('GPL3')
depends=('gzdoom')
optdepends=('doomseeker')
makedepends=('git')
source=(
	'http://libregeek.org/Linux/game-files/brutal-doom-64/bd64gamev2.pk3'
	'http://libregeek.org/Linux/game-files/brutal-doom-64/bd64mapsV2.pk3'
	'http://libregeek.org/Linux/game-files/brutal-doom-64/STAnnouncerPack.pk3'
	'http://libregeek.org/Linux/game-files/brutal-doom-64/ZD64MUSIC.PK3'
	'brutal-doom-64.desktop'
	'brutal-doom-64.png'
	'brutal-doom-64'
	'gzdoom.ini'
	'brutal-doom-64.install'
	)
sha256sums=(
	    '4bfb1681d76b82c495863a6a4217e96f0ea5769db31073759ddf7169a92fc17b'
	    'f5898170724ab2b65a3b7251753be8f9afbf8a2bc18a30534ead90ec9465906a'
	    '730a80c27c8261b9b3713608de89da26bb2aa47e71cc106a5e49d8b09f2aedc1'
	    'a4ae0348cc0a7c4266b513562c8b5410d6d4882f0fc33fee0adefb18410cbc7e'
            '4b749f35347e2c32df69ce9bb7bd51253e5b18101cda94a3a10cd8bb6ff674ae'
            '1b5a7c9625a7771a5ac2aca83700a759eda65027d96a6b7d229defd860db29ae'
	    '3414d5a4433ba640c0e4c76c7923d1e93f53e72396acae6942bae665f3ed2159'
            '099c749c3164d3825223e549b376bba7a0d3a61e127c9474c1f144c1dff5e582'
            '541425dc83f7d51801e0a1c1e22cd5de9740391d2f32ddbff081e7bc48546068'
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
	install -m644 "$srcdir/bd64gamev2.pk3" "$pkgdir/usr/share/games/$pkgname/bd64gamev2.pk3"
	install -m644 "$srcdir/bd64mapsV2.pk3" "$pkgdir/usr/share/games/$pkgname/bd64mapsV2.pk3"
	install -m644 "$srcdir/ZD64MUSIC.PK3" "$pkgdir/usr/share/games/$pkgname/ZD64MUSIC.PK3"
	install -m644 "$srcdir/STAnnouncerPack.pk3" "$pkgdir/usr/share/games/$pkgname/STAnnouncerPack.pk3"

	msg2 "Installing configuration files and other extras"
	install -m777 "brutal-doom-64.desktop" "$pkgdir/usr/share/applications/brutal-doom-64.desktop"
	install -m777 "brutal-doom-64.png" "$pkgdir/usr/share/pixmaps/brutal-doom-64.png"
	install -m777 "gzdoom.ini" "$pkgdir/usr/share/games/$pkgname/gzdoom.ini"
}
