pkgname=gnome-shell-extension-appindicator
pkgver=30
pkgrel=1
pkgdesc="Integrates AppIndicators into GNOME Shell"
arch=('any')
url="https://github.com/ubuntu/gnome-shell-extension-appindicator"
license=('GPL')
depends=('gnome-shell>=3.32')
optdepends=(
	'libappindicator-gtk2: support GTK+2 applications'
	'libappindicator-gtk3: support GTK+3 applications'
	'libappindicator-sharp: support .net applications'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2c6ec035ea18a042d7854233110e03c4a055b09240c1b7da8c729ff4e2032f75')

package() {
	cd "$pkgname-$pkgver"

	local _uuid="appindicatorsupport@rgcjonas.gmail.com"
	local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$_destdir"
	cp --parents -t "$_destdir" metadata.json *.js interfaces-xml/*.xml
}
