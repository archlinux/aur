# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
# Contributor: Martin Minka <martin.minka@gmail.com>

pkgname="annotator"
pkgver=2.0.1
pkgrel=1
pkgdesc="Image annotation for Elementary OS"
url="https://github.com/phase1geo/Annotator"
license=("GPL-3.0-or-later")
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=('libportal-gtk4' 'granite7' 'libxml2')
makedepends=('git' 'meson' 'vala')
source=("https://github.com/phase1geo/Annotator/archive/refs/tags/${pkgver}.tar.gz")
sha1sums=('a30928c4d42b32089c570a191ace2806c988e035')

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

