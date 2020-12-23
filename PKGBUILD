pkgname=midnight-gtk-theme-git
pkgver=r89.c24efd5
pkgrel=1
pkgdesc="A collection of dark gtk themes"
arch=("any")
license=("GPL3")
url="https://github.com/i-mint/midnight"
source=("git+https://github.com/i-mint/midnight.git")
sha256sums=("SKIP")

pkgver() {
	cd midnight
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/midnight"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
