# Contributor: gardenapple <mailbox@appl.garden>
# Maintainer: tee < teeaur at duck dot com >

pkgname=agregore-browser-bin
pkgver=2.23.0
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
provides=('agregore-browser')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL-3.0-or-later')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
options=('!strip')
source_x86_64=("$url/releases/download/v$pkgver/agregore-browser-$pkgver-linux-x64.pacman")
b2sums_x86_64=('840d104aa4668a68c43e2236f040cb06740b8a258c9c5b0dcd8a3c6ea542374fa1b374074144f6b6c09aac2bb026f42ddeee4c234a447a90fb9ce0cc82d71f64')

package() {
	mv opt/ usr/ "$pkgdir"
	install -Dm644 "$pkgdir/opt/Agregore Browser/resources/app.asar.unpacked/src/pages/icon.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/"
	install -dm755 "$pkgdir/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "$pkgdir/usr/bin/agregore-browser"
}
