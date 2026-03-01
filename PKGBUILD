# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=flags-common
pkgver=25.08.05
pkgrel=1
pkgdesc="Package of national flags"
arch=('any')
url="https://mxlinux.org"
license=('GPL-3.0-or-later')
source=("https://github.com/MX-Linux/flags-common/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install flags to /usr/share/flags-common/
    install -dm755 "$pkgdir/usr/share/flags-common"
    cp -r flags/* "$pkgdir/usr/share/flags-common/"

    # Copy flags to gxkb directory for compatibility
    install -dm755 "$pkgdir/usr/share/gxkb/flags"
    cp -r flags/* "$pkgdir/usr/share/gxkb/flags/"
}
