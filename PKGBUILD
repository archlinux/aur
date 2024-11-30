# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=agregore-browser-bin
pkgver=2.6.3
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
provides=('agregore-browser')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL-3.0-only')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source_x86_64=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v$pkgver/agregore-browser-$pkgver-linux-x64.pacman")
b2sums_x86_64=('6aa685b865c8c1942b912db3f8b41792bda7ae5011e32e0b99cb21e854ca57d2363dd423051825ca9829f027dea734c228920f962c7cbf51c11fb4b2849f31ff')

package() {
	mv opt/ usr/ "$pkgdir"

	# Fix icon location
	mv "$pkgdir/usr/share/icons/hicolor/0x0/apps" "$pkgdir/usr/share/pixmaps"

	# # SUID chrome-sandbox for Electron 5+
	# chmod 4755 '/opt/Agregore Browser/chrome-sandbox' || true

	mkdir -p "$pkgdir/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "$pkgdir/usr/bin/agregore-browser"
}
