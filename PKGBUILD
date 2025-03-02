# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-common-git"
_pkgname="customfetch"
pkgver=1.0.0.r2.3e97072
pkgrel=1
pkgdesc="Common files for customfetch terminal and GUI app versions (git)"
arch=('any')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
conflicts=('customfetch-common')
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    make install-common DESTDIR="${pkgdir}" PREFIX="/usr" DEBUG=0 GUI_APP=0
}
