# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
pkgname=swayshot 
pkgver=2.0.1
pkgrel=2
pkgdesc='Put your screenshots to XDG_PICTURES_DIR folder'
arch=('any')
url='https://gitlab.com/racy/swayshot'
license=('Apache')
depends=('sway' 'xdg-user-dirs' 'grim' 'slurp' 'jq')
optdepends=('xsel: copy the full path to clipboard (or xclip)'
	'xclip: copy the full path to clipboard (or xsel)')
conflicts=('swaygrab-helper')
source=(https://gitlab.com/racy/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('694c77150c93d43d43c25281a94aea0d67d19d38bf9a2fe105d5db5a1306f4b6')

package() {
	cd "$srcdir"/$pkgname-$pkgver

	install -d "$pkgdir"/etc/sway/config.d
	install -m 644 $pkgname.config "$pkgdir"/etc/sway/config.d/$pkgname
	install -d "$pkgdir"/usr/bin
	install -m 755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
