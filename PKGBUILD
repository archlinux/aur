# Maintainer: Jeremy Petch <jeremy.petch@outlook.com> 
pkgname=libgbm
pkgver=1.1.0
pkgrel=1
epoch=2
pkgdesc="libgbm is the Generic Buffer Management backend loader, which various packages and GBM vendors use. This package provides a standalone alternative to mesa."
arch=('x86_64')
url="https://github.com/glfs-book/libgbm"
license=('MIT')
groups=()
depends=('libdrm')
makedepends=('meson')
checkdepends=()
optdepends=()
provides=()
conflicts=('mesa')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/glfs-book/libgbm/archive/refs/tags/1.1.0.zip")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
