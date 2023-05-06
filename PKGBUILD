# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
# Contributor: Martin Minka <martin.minka@gmail.com>

pkgname="annotator"
pkgver=1.2.0
pkgrel=2
pkgdesc="Image annotation for Elementary OS"
url="https://github.com/phase1geo/Annotator"
license=(" GPL3")
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=('libxml2' 'libhandy' 'granite')
makedepends=('git' 'meson' 'vala')
provides=("Annotator")
source=("https://github.com/phase1geo/Annotator/archive/refs/tags/${pkgver}.tar.gz")
sha1sums=('c054889ecac4c6df5816f41af6648148289c6ee2')

build() {
	cd "${srcdir}/Annotator-${pkgver}"
    meson build --prefix=/usr	
    ninja -C build
}

package() {
	cd "${srcdir}/Annotator-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
    ln -sv com.github.phase1geo.annotator "$pkgdir/usr/bin/annotator"
}

