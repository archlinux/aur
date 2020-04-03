# Maintainer: Benoit Brummer < trougnouf at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >

pkgname=gnome-shell-extension-dash-to-panel
_name=dash-to-panel
pkgver=33
pkgrel=1
pkgdesc='Extension for GNOME shell to combine the dash and main panel'
arch=(any)
url="https://github.com/home-sweet-gnome/dash-to-panel"
license=(GPL2)
makedepends=(git gnome-common intltool make)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c01dff9a652f5c0c5e98230ba0c6b4a98774f2f487a806d59759c3222714a75c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    make VERSION="$pkgver" _build
}

package() {
    depends=('gnome-shell')
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
