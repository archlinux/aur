# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=agregore-browser-bin
pkgver=2.4.0
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
	diff -q .INSTALL ../upstream_supplied_script.install
	mv opt/ usr/ "$pkgdir"

	# This is done by the upstream_supplied_script.install, but only on post_install() and not on post_upgrade()
	# so for backwards compatibility I put this here
	mkdir -p "$pkgdir/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "$pkgdir/usr/bin/agregore-browser"
}
b2sums_x86_64=('e65dbccfb9e150c4220a67928d412222ef23b0cb68ff9536018bfe801651837769b531c489f588d92cd6e998d46cc8edcf97873910bd5050394349ba5cb8f28d')
