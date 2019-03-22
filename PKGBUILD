# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
pkgname=swayshot 
pkgver=2.1.0
pkgrel=1
pkgdesc='Put your screenshots to XDG_PICTURES_DIR folder'
arch=('any')
url='https://gitlab.com/racy/swayshot'
license=('Apache')
depends=('sway' 'xdg-user-dirs' 'grim' 'slurp' 'jq')
optdepends=('wl-clipboard: copy the full path to clipboard'
	'xsel: copy the full path to clipboard'
	'xclip: copy the full path to clipboard')
conflicts=('swaygrab-helper')
source=(https://gitlab.com/racy/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('4d20f78e16d6f733c0d047f5b1fd6c76b8470c5981b09cf421fff3328a90e1d0')

package() {
	cd "$srcdir"/$pkgname-$pkgver

	install -d "$pkgdir"/etc/sway/config.d
	install -m 644 $pkgname.config "$pkgdir"/etc/sway/config.d/$pkgname
	install -d "$pkgdir"/usr/bin
	install -m 755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
