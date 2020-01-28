# Maintainer: Formed <formed at tuta dot io>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=viper4linux-git
pkgver=r2.a208c06
pkgrel=1
epoch=1
pkgdesc="Implementation of the libviper library for modern Linux desktops."
arch=('x86_64')
url="https://github.com/Audio4Linux/Viper4Linux"
license=('GPL3')
depends=('gst-plugin-viper4linux' 'gst-plugins-good')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'jdsp4linux')
source=("${pkgname%-git}::git+https://github.com/Audio4Linux/Viper4Linux.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/etc"
	cp -r "${pkgname%-git}/" "$pkgdir/etc"
	install -Dm755 viper -t "$pkgdir/usr/bin"
}
