# Maintainer: Carl George < arch at cgtx dot us >

pkgname=gnome-shell-extension-dash-to-panel
_name=dash-to-panel
pkgver=7
pkgrel=1
pkgdesc='Extension for GNOME shell to combine the dash and main panel'
arch=(any)
url="https://github.com/jderose9/dash-to-panel"
license=(GPL2)
makedepends=(git gnome-common intltool)
source=("https://github.com/jderose9/dash-to-panel/archive/v${pkgver}.tar.gz")
sha256sums=('18caf45bf63b80c9087a156c1b3898c776972131114dc3e4b898338bf35e4c2b')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    make VERSION="$pkgver" _build
}

package() {
    depends=('gnome-shell>=3.18')
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
