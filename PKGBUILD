# Contributor: gardenapple <mailbox@appl.garden>
# Maintainer: tee < teeaur at duck dot com >

pkgname=agregore-browser-bin
pkgver=2.23.1
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
provides=('agregore-browser')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL-3.0-or-later')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
options=('!strip')
source_x86_64=("$url/releases/download/v$pkgver/agregore-browser-$pkgver-linux-x64.pacman")
b2sums_x86_64=('9eb31d88ecc4cc7d00d662ccac4e3239543f7d2e644579c891c9eab33b327ff44603606468dd8f11fb5ce35aac9bdc5ac4bb9e513a26af04eb68f31609683e7e')

package() {
	mv opt/ usr/ "$pkgdir"
	install -Dm644 "$pkgdir/opt/Agregore Browser/resources/app.asar.unpacked/src/pages/icon.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/"
	install -dm755 "$pkgdir/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "$pkgdir/usr/bin/agregore-browser"
}
