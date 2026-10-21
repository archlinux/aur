# Maintainer: fkzys <fkzys at proton dot me>
pkgname=bwrap-common
pkgver=0.0.8
pkgrel=1
pkgdesc="Reusable bubblewrap sandbox helpers for shell wrappers"
arch=('any')
url="https://github.com/fkzys/bwrap-common"
license=('AGPL-3.0-or-later')
depends=(
    'bubblewrap'
    'bash'
)
optdepends=(
    'xdg-dbus-proxy: filtered D-Bus access'
    'verify-lib: library integrity verification before sourcing'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d038cb90d2faadc52af987a96ecde3beedaf45c5ce2a43609b3086c4f3b393e3')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
