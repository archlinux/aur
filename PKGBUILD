# Maintainer: somini <dev@somini.xyz>
pkgname=xdg-autostart
pkgver=1.3.0
_pkgver="v$pkgver"
pkgrel=1
pkgdesc="Autostart programs according to the XDG specification"
arch=('x86_64')
url="https://gitlab.com/somini/xdg-autostart"
license=('GPL3')
makedepends=('vala' 'meson')
provides=('xdg-autostart')
conflicts=('xdg-autostart-hg')
source=("$pkgname-$_pkgver.tar.gz::https://gitlab.com/somini/xdg-autostart/-/archive/$_pkgver/xdg-autostart-$_pkgver.tar.gz")
sha256sums=('aab3d37c9774d40508e86aca69d44517ad238b05a0a9f69597734d5f74fb3a9e')

build() {
	cd "$srcdir/$pkgname-$_pkgver"
	arch-meson build
	ninja -C build
}
package() {
	cd "$srcdir/$pkgname-$_pkgver"
	install -Dm755 build/xdg-autostart -t "$pkgdir/usr/bin/"
}
