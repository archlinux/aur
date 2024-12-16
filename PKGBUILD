# Maintainer: Emily Ellis <emily@scgtrp.net>
pkgname=tangara-companion
pkgver=0.4.3
pkgrel=2
pkgdesc="Companion app for Cool Tech Zone Tangara"
depends=('glib2' 'gtk4' 'libadwaita')
makedepends=('cargo')
arch=(x86_64)
url="https://github.com/haileys/tangara-companion"
license=('GPL-3.0')
source=("https://github.com/haileys/tangara-companion/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9ae340186d0e7e49a77f0ab533be694c3e9069e78a924468e6130797d4f8149ff118159660a59c3c0a9afb1529fb2b76d9ccf7ca76066755866c35a5a0c5c287')

prepare() {
	cd "$pkgname-$pkgver"
	meson setup --buildtype=release --prefix="$pkgdir/usr" builddir
}

build() {
	cd "$pkgname-$pkgver"
	meson compile -C builddir
}

package() {
	cd "$pkgname-$pkgver"
	meson install -C builddir
}
