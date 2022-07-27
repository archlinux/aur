# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
pkgname=swayshot 
pkgver=2.7.1
pkgrel=1
pkgdesc='Sway screenshots: screen, window or region.'
arch=('any')
url='https://gitlab.com/radio_rogal/swayshot'
license=('GPL3')
depends=('sway' 'xdg-user-dirs' 'grim' 'slurp' 'jq')
optdepends=('wl-clipboard: copy the full path to clipboard'
	'xsel: copy the full path to clipboard'
	'xclip: copy the full path to clipboard'
	'curl: upload a screenshot to x0.at'
	'libnotify: show message with path or URL')
conflicts=('swaygrab-helper')
source=(https://gitlab.com/radio_rogal/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('308f6ff3fafcf932307c05c753b7e69205bdd33cdd148a28e03d3e428031fe2d')

package() {
	cd "$srcdir"/$pkgname-$pkgver

	install -d "$pkgdir"/etc/sway/config.d
	install -m 644 $pkgname.conf "$pkgdir"/etc/sway/config.d
	install -d "$pkgdir"/usr/bin
	install -m 755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
