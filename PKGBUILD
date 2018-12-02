# Maintainer: Florian Albertz <aur@albertz.io>
pkgname=plymouth-theme-elementary-git
pkgver=5.0.r20.c13dcc6
pkgrel=1
pkgdesc="The elementary os plymouth theme"
url="https://github.com/elementary/default-settings"
arch=('any')
license=('GPL2')
makedepends=('git')
provides=("plymouth-theme-elementary")
conflicts=("plymouth-theme-elementary")
source=('git+https://github.com/elementary/default-settings')
sha256sums=('SKIP')

pkgver() {
	cd "default-settings"

	git describe --tags | sed 's/-/.r/; s/-g/./'
}

package() {
	install -D --target-directory="$pkgdir/usr/share/plymouth/themes/elementary/" "$srcdir/default-settings/plymouth/elementary/"*
}