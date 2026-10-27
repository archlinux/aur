# Maintainer: fkzys <fkzys at proton dot me>
pkgname=bwrap-common
pkgver=0.0.9
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
sha256sums=('ad7780470f83b020b7ceb7b10eebf4461db16b3249884f6c7f05f01484024aa7')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
