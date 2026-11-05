# Maintainer: fkzys <fkzys at proton dot me>
pkgname=bwrap-common
pkgver=1.1.0
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
sha256sums=('285102f70c41f40fc0b87a991716287f3cf03bedb11b7c8a841a3f339fcad3eb')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" build
    make DESTDIR="${pkgdir}" install
}
