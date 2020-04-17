# Maintainer: Zanny <lordzanny@gmail.com>
# Maintainer: ProfessorKaos64 <mdeguzis@gmail.com>

pkgname=brutal-doom
pkgver=21
pkgrel=3
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
sha256sums=(
			'd4c901a92757c9ae7d3a8437172e4669fe0a3e939229160c26f99269b704a227'
			'7d285d342ba27a432e7b795fa1b7656bb9bd7cb9680105a8d7d565677fc56a9f'
			'91f58cc1c670c5408100305463960c195200f8ad35619eedd2c531dc9c60badf'
			'aee3fd4580da214b9c981534928de5dfef65461c459d5c56dd343bf579912b75'
			'905cc17cccca54d3c4da821cdd974c8540deacd42534077ca4da9092c4a96074'
			'9c2b7a7cd048fd4e6a7fe65b93376cf2d9a9fa4564b8f3cc7b2baac38ea8e5f3'
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
