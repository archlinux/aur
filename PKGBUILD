pkgname=identity
pkgver=0.1.0
pkgrel=1
pkgdesc='Compare multiple versions of an image or video'
arch=(x86_64)
url=https://gitlab.gnome.org/YaLTeR/identity
license=(GPL3)
depends=(
	gtk3
	gst-plugins-base
	gst-plugins-good
	libhandy1
)
makedepends=(
	meson
	rust
)
source=(https://gitlab.gnome.org/YaLTeR/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha256sums=('6d994ca2286976c8067076f323049a61a22ad4c5a3b2449265d33b5f57c3292a')

build() {
	arch-meson ${pkgname}-v${pkgver} build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
