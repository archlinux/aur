# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
pkgname=swayshot 
pkgver=2.0.0
pkgrel=1
pkgdesc='Put your screenshots to XDG_PICTURES_DIR folder'
arch=('any')
url='https://gitlab.com/racy/swayshot'
license=('Apache')
depends=('sway' 'xdg-user-dirs' 'grim' 'slurp' 'jq')
optdepends=('xsel: copy the full path to clipboard (or xclip)'
	'xclip: copy the full path to clipboard (or xsel)')
replaces=('swaygrab-helper')
source=(https://gitlab.com/racy/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('27f89d5c1185d4597f1d70f30dd021930c07121368ad2f4d871628f3a3602aa1')

package() {
	cd "$srcdir"/$pkgname-$pkgver

	install -d "$pkgdir"/etc/sway/config.d
	install -m 644 $pkgname.config "$pkgdir"/etc/sway/config.d/$pkgname
	install -d "$pkgdir"/usr/bin
	install -m 755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
