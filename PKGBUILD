# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
pkgname=swaygrab-helper 
pkgver=1.1.0
pkgrel=1
pkgdesc='Put your screenshots to XDG_PICTURES_DIR folder'
arch=('any')
url='https://bitbucket.org/all_gravy/swaygrab-helper'
license=('Apache')
depends=('sway' 'xdg-user-dirs')
optdepends=('xsel: copy the full path to clipboard (or xclip)'
	'xclip: copy the full path to clipboard (or xsel)')
source=($pkgname-$pkgver.tar.bz2::https://bitbucket.org/all_gravy/$pkgname/get/$pkgver.tar.bz2)
noextract=($pkgname-$pkgver.tar.bz2)
sha256sums=('ed6b90e6590a56d6ecbac2b4d1f405007454e1757df39c1fbe500f6bf6db7cd2')

prepare() {
	cd "$srcdir"

	tar -xf $pkgname-$pkgver.tar.bz2 --strip-components=1
}

package() {
	cd "$srcdir"

	install -d "$pkgdir"/etc/sway/config.d
	install -m 644 $pkgname.config "$pkgdir"/etc/sway/config.d/$pkgname
	install -d "$pkgdir"/usr/bin
	install -m 755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
