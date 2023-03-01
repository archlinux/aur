# Maintainer: Vova Abdrakhmanov <369565@gmail.com>
pkgname=vlauncher
pkgver=0.2.0
pkgrel=1
pkgdesc="Application launcher for Gnome"
arch=('any')
url="https://github.com/vlabdrake/vlauncher"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('vala' 'meson')
source=("$pkgname-$pkgver::git+https://github.com/vlabdrake/vlauncher#tag=$pkgver")
sha256sums=('SKIP')


build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}


package() {
	meson install -C build --destdir "$pkgdir"
}
