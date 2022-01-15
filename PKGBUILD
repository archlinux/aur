# Maintainer: Thomas Booker <tw.booker@outlook.com>
_pkgname=Playhouse
pkgname=playhouse
pkgver=r4.7ffa057
pkgrel=1
pkgdesc="A Playground for HTML/CSS/JavaScript"
arch=('any')
url="https://github.com/sonnyp/Playhouse"
license=('GPL')
depends=('webkit2gtk-5.0' 'gjs' 'gtk4')
makedepends=('git' 'meson')
source=("git+$url")
md5sums=(SKIP)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson $_pkgname build
	DESTDIR="$pkgdir" ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}

