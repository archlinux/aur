# Maintainer: Viktor Balogh <viktor.balogh45+aur at gmail dot com>
pkgname=plymouth-theme-legion-git
pkgver=r1.4a99f4e
pkgrel=1
pkgdesc="Plymouth theme with Lenovo Legion logo"
arch=('any')
url="https://github.com/MmAaXx500/plymouth-theme-legion"
license=('GPL3')
depends=('plymouth')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/MmAaXx500/plymouth-theme-legion")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/legion"
	install -Dm644 legion/* "${pkgdir}/usr/share/plymouth/themes/legion"
}
