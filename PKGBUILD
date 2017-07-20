# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
pkgname=swaygrab-helper 
pkgver=1.0.0
pkgrel=1
pkgdesc='Put your screenshots to XDG_PICTURES_DIR folder'
arch=('any')
url='https://bitbucket.org/all_gravy/swaygrab-helper'
license=('GPL')
depends=('sway' 'xdg-user-dirs')
# https://bitbucket.org/all_gravy/$pkgname/get/$pkgver.tar.bz2
source=($pkgname-$pkgver.tar.bz2::https://bitbucket.org/all_gravy/$pkgname/get/tip.tar.bz2)
noextract=($pkgname-$pkgver.tar.bz2)
sha256sums=('04c5391e74558e8d299e21f5cfc652ccca1733be4e4d9259748334606552d347')

prepare() {
	cd "$srcdir"

	tar -xf $pkgname-$pkgver.tar.bz2 --strip-components=1
}

package() {
	cd "$srcdir"

	install -d "$pkgdir"/etc/sway/config.d
	install -m 644 $pkgname.config "$pkgdir"/etc/sway/config.d/$pkgname
	install -d "$pkgdir"/usr/bin
	install -m 755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname.sh
}
