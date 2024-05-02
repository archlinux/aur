# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=agregore-browser-bin
pkgver=2.5.1
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
provides=('agregore-browser')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL-3.0-only')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source_x86_64=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v$pkgver/agregore-browser-$pkgver-linux-x64.pacman")
b2sums_x86_64=('6ebbdb6044ba057871d6f410dc57b5265c9f802c69833b58d2382cf1a548210125959cadd4d58baaedad4a2a9d5e19c1022da7b8f4e5186b83b2a45de45e9885')

package() {
	mv opt/ usr/ "$pkgdir"

	# Fix icon location
	mv "$pkgdir/usr/share/icons/hicolor/0x0/apps" "$pkgdir/usr/share/pixmaps"

	# # SUID chrome-sandbox for Electron 5+
	# chmod 4755 '/opt/Agregore Browser/chrome-sandbox' || true

	mkdir -p "$pkgdir/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "$pkgdir/usr/bin/agregore-browser"
}
