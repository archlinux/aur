# Maintainer: Kat Witten <turtlewit@live.com>
pkgname=sway-launcher-desktop-git
pkgver=r93.80b9323
pkgrel=2
pkgdesc="TUI Application launcher with Desktop Entry support."
arch=('any')
url="https://github.com/Biont/sway-launcher-desktop"
license=('GPL')
depends=('fzf')
makedepends=('git')
optdepends=('ttf-nerd-fonts-symbols: for launcher icon symbols')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Biont/sway-launcher-desktop.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# sway-launcher-desktop.sh installed as /usr/bin/sway-launcher-desktop
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/bin/"
	install -m 755 "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}
