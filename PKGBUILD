# Maintainer: Arnav Yash Chandra <arnavyash2004@gmail.com>
# Contributor: Denton Liu <liu.denton@gmail.com>
# Original patch by deusstultus: https://bugs.archlinux.org/task/28081#comment155230
pkgname=grub-linux-rt-default-hook
pkgver=1.0
pkgrel=1
pkgdesc="Patch grub to make vmlinuz-linux-rt the first entry"
arch=('any')
license=('MIT')
depends=('grub')
install="$pkgname.install"
source=("$pkgname.hook"
	"$pkgname.patch")
sha256sums=('efa065e231336926f05dd3c87f5e318ecf8118775fd11950b746a76db4256507'
	'3244aa01b24d793091b32c991836ddbf5e27e206e7f44ae9d7c8326d48e06dce')

package() {
	cd "$srcdir"
	install -Dm 644 "$pkgname.hook" "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
	install -Dm 644 "$pkgname.patch" "$pkgdir/usr/share/$pkgname/$pkgname.patch"
}
