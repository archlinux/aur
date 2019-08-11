# Maintainer: Denton Liu <liu.denton@gmail.com>
# Original patch by deusstultus: https://bugs.archlinux.org/task/28081#comment155230

pkgname=grub-linux-default-hook
pkgver=1.1
pkgrel=1
pkgdesc="Patch grub to make vmlinuz-linux the first entry"
arch=('any')
license=('MIT')
depends=('grub')
install="$pkgname.install"
source=("$pkgname.hook"
	"$pkgname.patch")
sha256sums=('bd7e0363d770c3898224a8d101f63979fa607042dc3621ecf98f638e0241858f'
	'1410678372799031c75a96a0a62904746c0c15f101dee4ba29c641f3de2ada4c')

package() {
	cd "$srcdir"
	install -Dm 644 "$pkgname.hook" "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
	install -Dm 644 "$pkgname.patch" "$pkgdir/usr/share/$pkgname/$pkgname.patch"
}
