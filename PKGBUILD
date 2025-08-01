# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
# Contributor: Martin Minka <martin.minka@gmail.com>

pkgname="annotator"
pkgver=2.0.0
pkgrel=5
pkgdesc="Image annotation for Elementary OS"
url="https://github.com/phase1geo/Annotator"
license=("GPL-3.0-or-later")
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=('libportal-gtk4' 'granite7' 'libxml2')
makedepends=('git' 'meson' 'vala' 'gtk3')
source=("https://github.com/phase1geo/Annotator/archive/refs/tags/${pkgver}.tar.gz")
sha1sums=('d6d0447d2ea88d7c2da944e527e1ef2dc7d60fa9')

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

