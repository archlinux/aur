# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=scarlett2-git
_pkgname=scarlett2
pkgver=2e74a61
pkgrel=1
pkgdesc='Scarlett2 Firmware Management Utility for Scarlett 2/3/4th gen, Clarett USB, and Clarett+ interfaces'
arch=('i686' 'x86_64')
url="https://github.com/geoffreybennett/scarlett2"
depends=()
makedepends=('gcc' 'make' 'git' 'pkgconf' 'sed')
license=('GPL-3.0-only')  # /usr/share/licenses/spdx/
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$(git describe --always --tags | sed 's/-/./g')"
}

build() {
    cd ${srcdir}/${_pkgname}
    make
}

package() {
    cd ${srcdir}/${_pkgname}
    install -vDm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -vDm 644 README.md   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
