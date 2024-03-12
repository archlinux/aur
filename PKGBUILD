# Maintainer: Dawid Rejowski <rejowski.xyz>
pkgname=wl-colorpicker-plasma-git
pkgver=r1.1ffb924
pkgrel=1
pkgdesc="A standalone color picker for Wayland and KDE Plasma."
arch=('any')
url="https://github.com/SASUPERNOVA/wl-colorpicker-plasma"
license=('GPL-2.0-or-later')
depends=(python)
source=("${pkgname%-VCS}::git+https://github.com/SASUPERNOVA/wl-colorpicker-plasma")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	install -Dm755 "./wl-colorpicker-plasma.py" "$pkgdir/usr/bin/wl-colorpicker-plasma"
}
