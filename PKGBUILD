# Maintainer: Carl George < arch at cgtx dot us >

pkgname=gnome-shell-extension-dash-to-panel
_name=dash-to-panel
pkgver=9
pkgrel=1
pkgdesc='Extension for GNOME shell to combine the dash and main panel'
arch=(any)
url="https://github.com/jderose9/dash-to-panel"
license=(GPL2)
makedepends=(git gnome-common intltool)
source=("https://github.com/jderose9/dash-to-panel/archive/v${pkgver}.tar.gz")
sha256sums=('e9a90d04d5891fd272c66aa44a3a87fe60219bcd43f9c0913293d97d0e3604bb')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    make VERSION="$pkgver" _build
}

package() {
    depends=('gnome-shell>=3.18')
    cd "${srcdir}/${_name}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
