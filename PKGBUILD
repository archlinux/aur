# Contributor: gardenapple <mailbox@appl.garden>
# Maintainer: tee < teeaur at duck dot com >

pkgname=agregore-browser-bin
pkgver=2.24.0
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
provides=('agregore-browser')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL-3.0-or-later')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
options=('!strip')
source_x86_64=("$url/releases/download/v$pkgver/agregore-browser-$pkgver-linux-x64.pacman")
b2sums_x86_64=('eb056169625d95bbc65755e2ceef3a7cdd6a977f3fcab0e69987503f62396ede02ed4ba08d8bf50c9424cc2a27a9e58d37511a97431e2e74786d4cf8742f1bf1')

package() {
	mv opt/ usr/ "$pkgdir"
	install -Dm644 "$pkgdir/opt/Agregore Browser/resources/app.asar.unpacked/build/icon-small.png" \
      "$pkgdir/usr/share/icons/hicolor/32x32/apps/agregore-browser.png"
	install -Dm644 "$pkgdir/opt/Agregore Browser/resources/app.asar.unpacked/src/pages/icon.svg" \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/agregore-browser.svg"
	install -dm755 "$pkgdir/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "$pkgdir/usr/bin/agregore-browser"
}
