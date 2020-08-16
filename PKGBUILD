# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=multimonitorlock
pkgver=2020.8.16
pkgrel=1
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
url="https://github.com/TheCynicalTeam/${pkgname}"
license=('GNU General Public License v3.0')
depends=('i3lock-color' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc')
optdepends=('feh: Allows setting wallpaper' 'multimonitorlock-gui: Allows the background to be changed')
makedepends=('git')
conflicts=('multilockscreen-git' 'betterlockscreen' 'betterlockscreen-git')
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=("c1f9abf45cb1010e0a7d972b94eb1e696659ed9b7ab65654622c0eac1f277d2d")
install=${pkgname}.install

package() {
	cd "$pkgname-$pkgver-$pkgrel"
	install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "system/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
	install -Dm 644 "examples/config" "$pkgdir/usr/share/doc/$pkgname/examples/config"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
