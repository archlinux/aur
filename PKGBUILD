# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=multimonitorlock
pkgver=2021.01.01
pkgrel=1
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
groups=('therepoclub')
url="https://github.com/TheCynicalTeam/${pkgname}"
license=('CC BY-NC-SA 4.0')
depends=('i3lock-color' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc' 'bash')
optdepends=('feh: Allows setting wallpaper' 'multimonitorlock-gui: Allows the background to be changed')
makedepends=('git')
conflicts=('multilockscreen-git' 'betterlockscreen' 'betterlockscreen-git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=("92cc4567b4ec95658949aef689a3b095b621eac53c25195d262ef70fe2e299bb")
install=${pkgname}.install

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "system/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
	install -Dm 644 "examples/config" "$pkgdir/usr/share/doc/$pkgname/examples/config"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
