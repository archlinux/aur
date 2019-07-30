# Maintainer: Benoit Brummer < trougnouf at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >

pkgname=gnome-shell-extension-dash-to-panel
_name=dash-to-panel
pkgver=20
pkgrel=1
pkgdesc='Extension for GNOME shell to combine the dash and main panel'
arch=(any)
url="https://github.com/jderose9/dash-to-panel"
license=(GPL2)
makedepends=(git gnome-common intltool make)
source=("https://github.com/jderose9/dash-to-panel/archive/v${pkgver}.tar.gz")
sha256sums=('6b8c68a03a0175827846ec03f1f8df8ff2e6a10356db0fab1b25d9868936617f')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    make VERSION="$pkgver" _build
}

package() {
    depends=('gnome-shell')
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
