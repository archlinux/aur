# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

pkgname=vim-lastplace-git
pkgver=3.2.1.r6.gd522829
pkgrel=1
pkgdesc="Intelligently reopen files at your last edit position"
arch=('any')
url="https://github.com/farmergreg/vim-lastplace"
license=('MIT')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=('vim-lastplace')
conflicts=('vim-lastplace')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find doc plugin \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
