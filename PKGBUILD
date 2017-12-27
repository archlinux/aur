# Maintainer: DriverX <thegio.f [at] gmail [dot] com>
# Contributor: Foivos S. Zakkak <foivos at zakkak dot net>
# Contributor: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

_pkgname=workspace-grid
pkgname=gnome-shell-extension-workspace-grid
pkgver=1.4.1
pkgrel=1
pkgdesc="Allows to configure your workspaces in a grid"
arch=('any')
url="https://github.com/zakkak/workspace-grid"
license=('GPL3')
depends=('gnome-shell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zakkak/workspace-grid/archive/v$pkgver.tar.gz")
sha512sums=('9a89da51b687d4f20003455760db7bd102ac4265073531a4781b824c6b130920a05164d65d81947d9a8331c209bc44fa9c69d17bfa5ae8ec9ac8607a3d97b923')

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
