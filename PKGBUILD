# Maintainer: Drommer <drommer@github.com>

pkgname=plasma5-theme-sweet-git
_pkgname=sweet-kde
pkgver=r18.48e2fa4
pkgrel=1
pkgdesc="Dark and modern Sweet theme for Plasma based on Helium"
provides=('plasma5-theme-sweet')
conflicts=('plasma-theme-sweet')
arch=('any')
url="https://github.com/EliverLara/$_pkgname"
license=('custom: CC-BY-SA-4.0')
depends=('plasma-desktop')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"
	install -d $pkgdir/usr/share/plasma/desktoptheme/sweet
	install -Dm644 "$_pkgname/LICENSE/CC BY-SA 4.0 EN.md" "$pkgdir/usr/share/licenses/$provides/LICENSE"
	mv $_pkgname/* "$pkgdir/usr/share/plasma/desktoptheme/sweet"
	rm -r $pkgdir/usr/share/plasma/desktoptheme/sweet/{LICENSE,preview,README.md}
}
