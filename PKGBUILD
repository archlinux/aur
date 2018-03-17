# Maintainer: Benoit Brummer < trougnouf at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >

pkgname=gnome-shell-extension-dash-to-panel
_name=dash-to-panel
pkgver=13
pkgrel=1
pkgdesc='Extension for GNOME shell to combine the dash and main panel'
arch=(any)
url="https://github.com/jderose9/dash-to-panel"
license=(GPL2)
makedepends=(git gnome-common intltool make)
source=("https://github.com/jderose9/dash-to-panel/archive/v${pkgver}.tar.gz")
sha256sums=('21be48952a04d56b5009cfd362a09abf52a7ac6c8bbf6a4bcb2aa7aed5816029')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    make VERSION="$pkgver" _build
}

package() {
    depends=('gnome-shell')
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
