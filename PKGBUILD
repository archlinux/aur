# Maintainer: Formed <formed at tuta dot io>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=viper4linux-git
pkgver=r46.cd42189
pkgrel=1
pkgdesc="Implementation of the libviper library for modern Linux desktops."
arch=('x86_64')
url="https://github.com/L3vi47h4N/Viper4Linux"
license=('GPL')
depends=('gst-plugin-viperfx' 'gst-plugins-good')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/L3vi47h4N/Viper4Linux.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -d "$pkgdir/etc"
    cp -r "${pkgname%-git}/viper4linux/" "$pkgdir/etc"
    install -Dm755 "${pkgname%-git}/viper" "$pkgdir/usr/bin/viper"
}
