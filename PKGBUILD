pkgname=wl-security-context
pkgver=0.1.0
pkgrel=1
pkgdesc="Run programs with wayland security context attached"
arch=('x86_64')
url="https://github.com/OkamiW/wl-security-context"
depends=('wayland')
makedepends=('meson' 'ninja' 'wayland-protocols')
source=("git+$url")
sha512sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	git checkout "v$pkgver"
	arch-meson build
	ninja -C build
}

package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir" ninja -C build install
}
