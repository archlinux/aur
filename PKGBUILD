# Maintainer: somini <dev@somini.xyz>
pkgname=xdg-autostart
pkgver=1.3.1
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
sha256sums=('ea054cdba0b8fcaee36658f1199a9ba7ba97328d38276d99f9c3c5b086a6cf53')

build() {
	cd "$srcdir/$pkgname-$_pkgver"
	arch-meson build
	ninja -C build
}
package() {
	cd "$srcdir/$pkgname-$_pkgver"
	install -Dm755 build/xdg-autostart -t "$pkgdir/usr/bin/"
}
