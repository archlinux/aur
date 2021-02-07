# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=surface-performance-indicator-git
_repo=surface-performance-indicator
pkgver=r5.23bc85d
pkgrel=1
pkgdesc="Switching Surface performance modes"
arch=('any')
url="https://github.com/SamLukeYes/surface-performance-indicator"
license=('GPL3')
makedepends=('git')
depends=('python-pystray' 'surface-control')
optdepends=()
provides=('surface-performance-indicator' 'spi')
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
    cd ${srcdir}/$_repo
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/$_repo
    install -d ${pkgdir}/usr/{bin,share/applications}
    install -m755 spi.py ${pkgdir}/usr/bin/spi
    install -m644 surface-performance-indicator.desktop ${pkgdir}/usr/share/applications
}