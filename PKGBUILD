# Maintainer: Martin Minka <martin.minka@gmail.com>

pkgname="annotator"
pkgver=1.0.0
pkgrel=1
pkgdesc="Image annotation for Elementary OS"
url="https://github.com/phase1geo/Annotator"
license=(" GPL-3.0")
arch=("i686" "x86_64")
depends=('gtk3' 'vala' 'libxml2' 'libhandy' 'libgee' 'granite')
makedepends=('git' 'meson')
provides=("Annotator")
source=("https://github.com/phase1geo/Annotator/archive/refs/tags/${pkgver}.tar.gz")
sha1sums=('cafc3e6235b10321154e8537f14092ff9835dadb')

build() {
	cd "${srcdir}/Annotator-${pkgver}"
    meson build --prefix=/usr	
    ninja -C build
}

package() {
	cd "${srcdir}/Annotator-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}

