# Maintainer: gardenapple <mailbox at appl garden>

pkgname=ib-en
pkgver=1.0.7
pkgrel=3
pkgdesc='Freeware horror adventure game by kouri (English translation)'
url='https://vgperson.com/games/ib.htm'
arch=('any')
license=('LicenseRef-Freeware')
depends=('easyrpg-player')
makedepends=('icoutils')
source=('https://vgperson.com/games/Ib107.zip'
        'Ib'
        'Ib.desktop')
sha512sums=('c2700b87b4e0d25218acbbf922ab705731f9bccfe50deb9b441eeaa9a6d00d78d945a607af09eca463007d497f9f76b75e5ec06f2e76f318d58cb1321652e393'
            '90b4e627bedd1fa0ac19caaf45ea495e31af311c6c247e3c600020e4a450d8b1a391c037237a479a60b39d3bf3890be48704cbe3895a1c5025d561e0883a1349'
            'efe0748fdd87345bee2686ccf6166a8110431149d304b6f36288a263a38b136ed456f28967ca26104d73d71c8039e2ca2981ef966a192c33ee0a078fcba39816')

package() {
	wrestool --extract --output=icon.ico --type=group_icon StartFullscreen.exe
	mkdir -p "$pkgdir/usr/share/pixmaps"
	icotool --extract --output="$pkgdir/usr/share/pixmaps/Ib.png" icon.ico

	# Does not seem to be required but easyrpg-player complains when this is deleted
	# rm Data/RPG_RT.exe

	mkdir -p "$pkgdir/usr/lib"
	mv Data "$pkgdir/usr/lib/Ib"

	install -Dm644 'Ib Manual.txt' -t "$pkgdir/usr/share/doc/Ib"
	install -Dm644 Ib.desktop -t "$pkgdir/usr/share/applications"
	install -Dm755 Ib -t "$pkgdir/usr/bin"
}
