# Maintainer: star2000 <i@star2000.work>

pkgname=nopasswd
pkgver=1.0.0
pkgrel=1
pkgdesc="Don't ask wheel group users for root password"
arch=('any')
url='https://github.com/star2000/nopasswd'
license=('GPL3')
source=('sudo' 'kdesu.conf' 'polkit.js')
md5sums=('a28ba1709db9a9c1e54f3de1bc0952d5'
	'3f45620a064f378b83489ca3e96e5f0b'
	'c7666e87d18aae835bbcd03cf32a2905')
package() {
	install -Dm440 "$srcdir/sudo" "$pkgdir/etc/sudoers.d/49-nopasswd"
	install -Dm644 "$srcdir/polkit.js" "$pkgdir/etc/polkit-1/rules.d/49-nopasswd.rules"
	install -Dm644 "$srcdir/kdesu.conf" "$pkgdir/etc/xdg/kdesurc"
}
