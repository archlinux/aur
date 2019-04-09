pkgname=gnome-shell-extension-appindicator
pkgver=28
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
sha256sums=('d978e082b8880bfcaeb255bd77eaf25914876dd08dd749e209e55bed79823ce3')

package() {
	cd "$pkgname-$pkgver"

	local _uuid="appindicatorsupport@rgcjonas.gmail.com"
	local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$_destdir"
	cp --parents -t "$_destdir" metadata.json *.js interfaces-xml/*.xml
}
