# Maintainer: fa5e4658010be730
pkgname=bwrap-common
pkgver=0.0.1
pkgrel=1
pkgdesc="Reusable bubblewrap sandbox helpers for shell wrappers"
arch=('any')
url="https://gitlab.com/fkzys/bwrap-common"
license=('GPL-3.0-only')
depends=(
    'bubblewrap'
    'bash'
)
optdepends=(
    'xdg-dbus-proxy: filtered D-Bus access'
    'verify-lib: library integrity verification before sourcing'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('16ebd0bd6343bda9027b5fc6544e1d388f4acf752b725eb619750824f3743c77')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
