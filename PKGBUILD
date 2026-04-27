# Maintainer: fkzys <fkzys at proton dot me>
pkgname=bwrap-common
pkgver=0.0.5
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
sha256sums=('e03ee705e5c090c5b47abbff0d62972b48fa7de21f9d35c2f2c6513e146b9f84')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
