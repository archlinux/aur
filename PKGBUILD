# Maintainer: Formed <formed at tuta dot io>
# Co-Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=viper4linux-git
pkgver=r64.49fdbe7
pkgrel=1
pkgdesc="Implementation of the libviper library for modern Linux desktops."
arch=('x86_64')
url="https://github.com/noahbliss/Viper4Linux"
license=('GPL3')
depends=('gst-plugin-viper4linux' 'gst-plugins-good')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'jdsp4linux')
source=("${pkgname%-git}::git+https://github.com/noahbliss/Viper4Linux.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/etc"
	cp -r "${pkgname%-git}/" "$pkgdir/etc"
	install -Dm755 viper "$pkgdir/usr/bin/viper"
}
