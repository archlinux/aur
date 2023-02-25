# Maintainer: Your Name <youremail@domain.com>
pkgname=vlauncher
pkgver=0.1.0
pkgrel=1
pkgdesc="Application launcher for Gnome"
arch=('any')
url="https://github.com/vlabdrake/vlauncher"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('vala' 'meson')
source=("$pkgname-$pkgver::git+https://github.com/vlabdrake/vlauncher#commit=e9952d4")
sha256sums=('SKIP')


build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}


package() {
	meson install -C build --destdir "$pkgdir"
}
