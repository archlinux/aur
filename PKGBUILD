# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=flags-common
pkgver=26.02arch
pkgrel=1
pkgdesc="Package of national flags"
arch=('any')
url="https://mxlinux.org"
license=('GPL-3.0-or-later')
source=("https://github.com/MX-Linux/flags-common/archive/refs/tags/26.02arch.tar.gz")
sha256sums=('4e115aa93eb2aa5b679022daa220f800ae70b9a7588cbe49776f2a9dd0aa1a74')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install flags to /usr/share/flags-common/
    install -dm755 "$pkgdir/usr/share/flags-common"
    cp -r flags/* "$pkgdir/usr/share/flags-common/"

    # Copy flags to gxkb directory for compatibility
    install -dm755 "$pkgdir/usr/share/gxkb/flags"
    cp -r flags/* "$pkgdir/usr/share/gxkb/flags/"
}
