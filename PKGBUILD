# Maintainer: Benoit Brummer < trougnouf at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >

pkgname=gnome-shell-extension-dash-to-panel
_name=dash-to-panel
pkgver=35
pkgrel=1
pkgdesc='Extension for GNOME shell to combine the dash and main panel'
arch=(any)
url="https://github.com/home-sweet-gnome/dash-to-panel"
license=(GPL2)
makedepends=(git gnome-common intltool make)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a0bc8554f4adb783d77ec56358efa058e6c81fdef6bc794f4eb8c76b0d79d76d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    make VERSION="$pkgver" _build
}

package() {
    depends=('gnome-shell')
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
