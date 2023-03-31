# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=agregore-browser-bin
_pkgver=2.0.0
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
provides=('agregore-browser')
# no longer offer anything other than x86_64
# arch=('x86_64' 'i686' 'aarch64')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source_x86_64=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v$_pkgver/agregore-browser-$_pkgver-linux-x64.pacman")
install="upstream_supplied_script.install"

package() {
	diff -q .INSTALL ../upstream_supplied_script.install
	mv opt/ usr/ "$pkgdir"

	# This is done by the upstream_supplied_script.install, but only on post_install() and not on post_upgrade()
	# so for backwards compatibility I put this here
	mkdir -p "$pkgdir/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "$pkgdir/usr/bin/agregore-browser"
}
b2sums_x86_64=('09df134b3999a11c711fb26dfec444ae6ed5f93611e5b202492ac5274ce07cdb37cfcd81fd4d012e943fef840a9c0e05125b00a8dffab61c08f8c62de54069f6')
