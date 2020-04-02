# Maintainer: Benoit Brummer < trougnouf at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >

pkgname=gnome-shell-extension-dash-to-panel
_name=dash-to-panel
pkgver=32
pkgrel=2
pkgdesc='Extension for GNOME shell to combine the dash and main panel'
arch=(any)
url="https://github.com/home-sweet-gnome/dash-to-panel"
license=(GPL2)
makedepends=(git gnome-common intltool make)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d8f428e7a2a49746b7c4c77a1ac79cdc88f6973250b02656815797cba1944923')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    make VERSION="$pkgver" _build
}

package() {
    depends=('gnome-shell')
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
