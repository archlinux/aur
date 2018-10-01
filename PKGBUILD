# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writeas-gtk
pkgver=1.0.0
pkgrel=0
pkgdesc="Write.as GTK desktop app"
arch=('x86_64')
url="https://write.as/apps/desktop"
license=(GPL)
depends=(
	'writeas-cli'
	'gtksourceview3'
	'gtk3'
)
makedepends=(
	'meson'
	'ninja'
	'vala'
)
source=(https://code.as/writeas/writeas-gtk/archive/v$pkgver.tar.gz)
sha256sums=('c6487821b5fbeef38ee50082d42a89be97b2fdbd5c3205d8a9c961ca0c3c7fbf')

build() {
	cd "${srcdir}/${pkgname}"
	meson build --prefix="${pkgdir}/usr" --reconfigure
	ninja -C "build"
}

package() {
	ninja install -C "${srcdir}/${pkgname}/build"
}
