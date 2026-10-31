# Maintainer: fkzys <fkzys at proton dot me>
pkgname=bwrap-common
pkgver=1.0.0
pkgrel=1
pkgdesc="Reusable bubblewrap sandbox helpers for shell wrappers"
arch=('any')
url="https://github.com/fkzys/bwrap-common"
license=('AGPL-3.0-or-later')
depends=(
    'bubblewrap'
    'bash'
    'xdg-dbus-proxy'
)
optdepends=(
    'verify-lib: library integrity verification before sourcing'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e21a791c7a15cf0c40748f4752fe3a65a9a0e68c345b32431e4f148ba57cf9b7')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" build
    make DESTDIR="${pkgdir}" install
}
