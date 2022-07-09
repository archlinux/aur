# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
# Contributor: Martin Minka <martin.minka@gmail.com>

pkgname="annotator"
pkgver=1.1.1
pkgrel=2
pkgdesc="Image annotation for Elementary OS"
url="https://github.com/phase1geo/Annotator"
license=(" GPL-3.0")
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=('gtk3' 'libxml2' 'libhandy' 'libgee' 'granite')
makedepends=('git' 'meson' 'vala')
provides=("Annotator")
source=("https://github.com/phase1geo/Annotator/archive/refs/tags/${pkgver}.tar.gz")
sha1sums=('4b3ca487838eca1be543a73ef3ffa244c84a8b6c')

build() {
	cd "${srcdir}/Annotator-${pkgver}"
    meson build --prefix=/usr	
    ninja -C build
}

package() {
	cd "${srcdir}/Annotator-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}

