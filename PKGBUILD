# Maintainer: fa5e4658010be730
pkgname=bwrap-common
pkgver=0.0.4
pkgrel=1
pkgdesc="Reusable bubblewrap sandbox helpers for shell wrappers"
arch=('any')
url="https://gitlab.com/fkzys/bwrap-common"
license=('AGPL-3.0-or-later')
depends=(
    'bubblewrap'
    'bash'
)
optdepends=(
    'xdg-dbus-proxy: filtered D-Bus access'
    'verify-lib: library integrity verification before sourcing'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('c0df144393255e84ee7d19294cb9389bdb28f9950f5346bbf0249ad6ec49602f')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
