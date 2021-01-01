# Maintainer: WatcherWhale

pkgname=pop-nord
pkgver=1.1.1
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
sha256sums=('0051e502ada1c28c9cdd05722a0b58a62c1dcf784cd0a368be5b6ccef34bd676')

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
