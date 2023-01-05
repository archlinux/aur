# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=agregore-browser-bin
pkgver=1.10.1
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
provides=('agregore-browser')
# no longer offer anything other than x86_64
# arch=('x86_64' 'i686' 'aarch64')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source_x86_64=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v$pkgver/agregore-browser-$pkgver-linux-x64.pacman")
install="upstream_supplied_script.install"

package() {
	# bsdtar xf "$srcdir/agregore-browser-$pkgver-linux-x64"
	diff -q .INSTALL ../upstream_supplied_script.install
	mv opt/ usr/ "$pkgdir"

	# This is done by the upstream_supplied_script.install, but only on post_install() and not on post_upgrade()
	# so for backwards compatibility I put this here
	mkdir -p "$pkgdir/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "$pkgdir/usr/bin/agregore-browser"
}
b2sums_x86_64=('c99a55880a7e95f7db79da1fa5be9dd79aba50d93e7ab8b71ca31de4e818ac70c384c9524325f4a1d27201b592d50caf7710b126b7186dcac1b42d9f12c81ec0')
