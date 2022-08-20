# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=grub-linux-default-hook
pkgver=2.0
pkgrel=1
pkgdesc="Patch grub to make vmlinuz-linux the first entry"
arch=('any')
license=('MIT')
depends=('grub>=2:2.06.r297.g0c6c1aff2-1')
install="$pkgname.install"
source=("$pkgname.hook"
        "$pkgname.patch")
sha256sums=('bd7e0363d770c3898224a8d101f63979fa607042dc3621ecf98f638e0241858f'
            '3f1e204b95dd52c731080a22095ee83c522c6c0de34958d707369387db316c99')

package() {
	cd "$srcdir"
	install -Dm 644 "$pkgname.hook" "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
	install -Dm 644 "$pkgname.patch" "$pkgdir/usr/share/$pkgname/$pkgname.patch"
}
