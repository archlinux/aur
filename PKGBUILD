# Maintainer: WatcherWhale

pkgname=pop-nord
pkgver=1.1.0
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
sha256sums=('655c33b0eccfb02898b31240ee5f3dc1fc7b9e9de5ebac4fb28da43664378c71')

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
