# Maintainer: Carl George < arch at cgtx dot us >

pkgname=gnome-shell-extension-dash-to-panel
_name=dash-to-panel
pkgver=6
pkgrel=1
pkgdesc='Extension for GNOME shell to combine the dash and main panel'
arch=(any)
url="https://github.com/jderose9/dash-to-panel"
license=(GPL2)
makedepends=(git gnome-common intltool)
source=("https://github.com/jderose9/dash-to-panel/archive/v${pkgver}.tar.gz")
sha256sums=('28613995e4b6c6ef23a933972ad99d843ff4def2753b6cf4702b4283427394a1')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    make VERSION="$pkgver" _build
}

package() {
    depends=('gnome-shell>=3.18')
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
