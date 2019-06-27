# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=grub-linux-default-hook
pkgver=1.0
pkgrel=1
pkgdesc="Patch grub to make vmlinuz-linux the first entry"
arch=('any')
license=('MIT')
depends=('grub')
install="$pkgname.install"
source=("$pkgname.hook"
	"$pkgname.patch")
sha256sums=('bd7e0363d770c3898224a8d101f63979fa607042dc3621ecf98f638e0241858f'
	'95a8c61846665b029d3d11cdb77b9208103fb55375e34032debac6cef2ecce39')

package() {
	cd "$srcdir"
	install -Dm 644 "$pkgname.hook" "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
	install -Dm 644 "$pkgname.patch" "$pkgdir/usr/share/$pkgname/$pkgname.patch"
}
