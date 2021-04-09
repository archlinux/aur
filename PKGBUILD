# Maintainer: WatcherWhale

pkgname=pop-nord
pkgver=1.1.2
pkgrel=1
pkgdesc="The pop-nord theme"
arch=('x86_64')
depends=('gdk-pixbuf2' 'gtk-engine-murrine')
makedepends=('meson' 'sassc' 'glib2')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/Zaedus/Pop-nord/archive/v${pkgver}-nord-pop.tar.gz"
)

url="https://github.com/Zaedus/Pop-nord"
license=('GPL-3.0-or-later')
sha256sums=('435a684d2ea9474f88e1b5ad523cac4507606736868a0ee01105ca6b70e28e91')

build() {
    cd "${srcdir}/Pop-nord-${pkgver}-nord-pop"
        meson build --prefix "${pkgdir}/usr/"
    cd build
    ninja
}

package() {
    cd "${srcdir}/Pop-nord-${pkgver}-nord-pop/build"
    ninja install
}
