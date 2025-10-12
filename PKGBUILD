# Maintainer: username227 <gfrank227 [at] gmail [dot] com>

pkgname=tabletop-club-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Tabletop Club is an open-source multiplayer game that allows you to play your favourite tabletop games in a physics-driven 3D environment with the use of easy-to-make asset packs!"
arch=(x86_64)
url="https://github.com/drwhut/tabletop-club"
license=(MIT)
depends=('glibc' 'libx11' 'libxext' 'libxrender' 'libxtst' 'libxrandr' 'libxi')
source=("https://github.com/drwhut/tabletop-club/releases/download/v$pkgver/TabletopClub_v${pkgver}_Linux_64.zip"
	"tabletop-club.desktop"
	"tabletop-club.png::https://raw.githubusercontent.com/drwhut/tabletop-club/v$pkgver/game/tabletop_club_icon.png"
	"tabletop-club")
sha256sums=('aac2ed8b2f9471f472ce41e7efbefd12e4036d846124c5edca6d0edd33220d4c'
            'ca407351743ca350b2656c8e956f25f7a0acf6c3e3a8add1868e0804c95dc469'
            '03e9804048af5db696fb49e7bc4c62c8011509dd75132ff5232a5d939838894f'
            '55d674d290af6a3df9d0ba2afb25b6b1e6155ac20299bc11ba23901b156a6f9f')
            
package() {
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/tabletop-club"
	install -dm755 "$pkgdir/usr/share/applications"
	install -dm755 "$pkgdir/usr/share/tabletop-club/assets/assets"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	install -m755 "$srcdir/TabletopClub.x86_64" -t "$pkgdir/usr/share/tabletop-club"
	install -m644 "$srcdir/TabletopClub.pck" -t "$pkgdir/usr/share/tabletop-club"
	cp -r assets "$pkgdir/usr/share/tabletop-club/assets/"
	mv "$pkgdir/usr/share/tabletop-club/TabletopClub.pck" "$pkgdir/usr/share/tabletop-club/TabletopClub.x86_64.pck"
	install -m755 $srcdir/tabletop-club.desktop -t $pkgdir/usr/share/applications
	install -m644 $srcdir/tabletop-club.png -t $pkgdir/usr/share/icons/hicolor/256x256/apps
	install -m755 $srcdir/tabletop-club -t $pkgdir/usr/bin
}
