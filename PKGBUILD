# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=agregore-browser-bin
pkgver=2.19.0
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
provides=('agregore-browser')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL-3.0-only')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source_x86_64=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v$pkgver/agregore-browser-$pkgver-linux-x64.pacman")
b2sums_x86_64=('f60685311c1ca8b67c9250778896795fcfa77c725cecb12d757a798f34d38e9d178fcf5fa169312f25feec5d3b0f13c3bd5d57d47c93b20d4cbc25a7f5aaf252')

package() {
	mv opt/ usr/ "$pkgdir"

	# Fix icon location
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable"
	cp "$pkgdir/opt/Agregore Browser/resources/app.asar.unpacked/src/pages/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/"

	# # SUID chrome-sandbox for Electron 5+
	# chmod 4755 '/opt/Agregore Browser/chrome-sandbox' || true

	mkdir -p "$pkgdir/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "$pkgdir/usr/bin/agregore-browser"
}
