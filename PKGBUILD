# Maintainer: fossdd <fossdd@pwned.life>
pkgname=gmobile
pkgver=0.1.0
pkgrel=2
pkgdesc="Functions useful in mobile related, glib based projects"
arch=('x86_64')
url="https://gitlab.gnome.org/World/Phosh/gmobile"
license=('GPL-3.0')
groups=()
depends=('glib2' 'json-glib')
makedepends=('git' 'meson')
source=("git+$url.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	arch-meson $pkgname _build
	meson compile -C _build
}

check() {
	meson test -C _build
}

package() {
	meson install -C _build --destdir "$pkgdir"
}
