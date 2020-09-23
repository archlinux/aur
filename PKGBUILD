# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=multimonitorlock
pkgver=2020.9.23
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
sha256sums=("56c8fd08449cc2015303a6382b831e5f3ce7fb7d7694a26ca5f59a92577294e4")
install=${pkgname}.install

package() {
	cd "$pkgname-$pkgver-$pkgrel"
	install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "system/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
	install -Dm 644 "examples/config" "$pkgdir/usr/share/doc/$pkgname/examples/config"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
