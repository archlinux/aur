# Maintainer: DriverX <thegio.f [at] gmail [dot] com>
# Contributor: Foivos S. Zakkak <foivos at zakkak dot net>
# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

_pkgname=workspace-grid
pkgname=gnome-shell-extension-workspace-grid
pkgver=1.5
pkgrel=1
pkgdesc="Allows to configure your workspaces in a grid"
arch=('any')
url="https://github.com/zakkak/workspace-grid"
license=('GPL3')
depends=('gnome-shell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zakkak/workspace-grid/archive/v$pkgver.tar.gz")
sha512sums=('d357082b23850f51590b4cb3afd635504fd41d8d1c8170e923c7dcc031ea57a015bbd0a81aea3661b0f9e3b397f29ba89b1bb16f438c4bbde0492a26e0b76b57')

_uuid='workspace-grid@mathematical.coffee.gmail.com'

build() {
	cd "$srcdir/"$_pkgname-$pkgver
	make
}

package() {
	cd "$srcdir/"$_pkgname-$pkgver/$_uuid

	install -dm 755 "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid
	install -Dm644 schemas/org.gnome.shell.extensions.workspace-grid.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.workspace-grid.gschema.xml

	cp -af * "${pkgdir}"/usr/share/gnome-shell/extensions/$_uuid
}
