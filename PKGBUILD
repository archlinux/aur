# Maintainer: Benoit Brummer < trougnouf at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >

pkgname=gnome-shell-extension-dash-to-panel
_name=dash-to-panel
pkgver=50
pkgrel=1
pkgdesc='Extension for GNOME shell to combine the dash and main panel'
arch=(any)
url="https://github.com/home-sweet-gnome/dash-to-panel"
license=(GPL2)
makedepends=(git gnome-common intltool make)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('192abfd84b9a6108a2c31cb74afbdbdee49ba824ec91687e7ca60bd58fe5b435')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    make VERSION="$pkgver" _build
}

package() {
    depends=('gnome-shell')
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
