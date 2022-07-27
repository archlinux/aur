# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
pkgname=swayshot 
pkgver=2.7.3
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
sha256sums=('798f02532711bf690dfc94800f4c7e6fc0128dff8557fe9f43c6edce7e2833e8')

package() {
	cd "$srcdir"/$pkgname-$pkgver

	install -d "$pkgdir"/etc/sway/config.d
	install -m 644 $pkgname.conf "$pkgdir"/etc/sway/config.d
	install -d "$pkgdir"/usr/bin
	install -m 755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
