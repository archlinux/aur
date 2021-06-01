# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=multimonitorlock
pkgver=2021.06.01
pkgrel=1
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/${pkgname}"
license=('CC BY-NC-SA 4.0')
depends=('i3lock-color' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc' 'bash')
optdepends=('feh: Allows setting wallpaper' 'multimonitorlock-gui: Allows the background to be changed')
makedepends=('git')
conflicts=('multilockscreen-git' 'betterlockscreen' 'betterlockscreen-git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=("a4248099bb59999f2e5bd666afd98697214aa8e80774859a0a485a77d15d4194")
install=${pkgname}.install

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "system/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
	install -Dm 644 "examples/config" "$pkgdir/usr/share/doc/$pkgname/examples/config"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
