# Maintainer: Gabriel Hansson <gabrielhansson00 at gmail dot com>
pkgname=sway-rofi-screenshot-git
pkgver=r11.6f1014e
pkgrel=1
pkgdesc="Interactively take screenshots using Rofi in Sway."
arch=('any')
url="https://github.com/gibbz00/sway-rofi-screenshot"
license=('MIT')
depends=('jq' 'rofi-lbonn-wayland-git' 'grim' 'slurp' 'libnotify' 'wl-clipboard')
makedepends=('git')
optdepends=('swappy: edit screenshots')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 755 sway-rofi-screenshot "$pkgdir/usr/bin/sway-rofi-screenshot"
}
