# Maintainer: Kat Witten <turtlewit@live.com>
pkgname=sway-launcher-desktop-git
pkgver=r53.e81161a
pkgrel=1
pkgdesc="A TUI-based launcher menu made with bash and the amazing fzf."
arch=('any')
url="https://github.com/Biont/sway-launcher-desktop"
license=('GPL')
depends=('fzf')
makedepends=('git')
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
