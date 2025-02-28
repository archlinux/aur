# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=agregore-browser-bin
pkgver=2.8.2
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
provides=('agregore-browser')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL-3.0-only')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source_x86_64=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v$pkgver/agregore-browser-$pkgver-linux-x64.pacman")
b2sums_x86_64=('77b9ec18364a9842dd07ac3b7a0c0f87d713c5d6c842bbdc33c694c5b558b9a3d87a0dfe582aff24296b69bd2209b0bc6c28bdef317298db3ed0dabfdc95cc6f')

package() {
	mv opt/ usr/ "$pkgdir"

	# Fix icon location
	mv "$pkgdir/usr/share/icons/hicolor/0x0/apps" "$pkgdir/usr/share/pixmaps"

	# # SUID chrome-sandbox for Electron 5+
	# chmod 4755 '/opt/Agregore Browser/chrome-sandbox' || true

	mkdir -p "$pkgdir/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "$pkgdir/usr/bin/agregore-browser"
}
