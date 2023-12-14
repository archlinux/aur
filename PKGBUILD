# Maintainer: Dawid Rejowski <rejowski.xyz>
pkgname=pacpaper-git
pkgver=r4.c600133
pkgrel=1
pkgdesc="Wallpaper that applies a mask effect with text listing packages on system"
arch=("any")
url="https://codeberg.org/Didek/pacpaper"
license=('GPL3')
depends=("imagemagick" "gsfonts")
makedepends=('git')
provides=("pacpaper")
conflicts=("pacpaper")
source=("${pkgname%-VCS}::git+https://codeberg.org/Didek/pacpaper")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	install -Dm755 "./pacpaper" "$pkgdir/usr/bin/pacpaper"
	install -Dm644 "./base_wallpaper.png" "$pkgdir/usr/share/pacpaper/base_wallpaper.png"
}
