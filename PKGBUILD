# Maintainer: fkzys <fkzys at proton dot me>
pkgname=bwrap-common
pkgver=0.0.5
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
sha256sums=('1e61f7efe00a7c509c94f7f167d429777d1a0850cc9be0a39ae089a6705a0398')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
