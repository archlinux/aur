pkgname=gnome-shell-extension-appindicator
pkgver=22
pkgrel=1
pkgdesc="Integrates AppIndicators into GNOME Shell"
arch=('any')
url="https://github.com/ubuntu/gnome-shell-extension-appindicator"
license=('GPL')
depends=('gnome-shell')
optdepends=(
	'libappindicator-gtk2: support GTK+2 applications'
	'libappindicator-gtk3: support GTK+3 applications'
	'libappindicator-sharp: support .net applications'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1e651243b8873a5a0faa2e61722da4a3292668b04a53c0942adc9e59c69bc5c0')

package() {
	cd "$pkgname-$pkgver"

	local _uuid="appindicatorsupport@rgcjonas.gmail.com"
	local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/$_uuid"

	install -d "$_destdir"
	cp --parents -t "$_destdir" metadata.json *.js interfaces-xml/*.xml
}
