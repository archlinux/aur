# Maintainer: lhark <lhark at hotmail dot fr>

pkgname=msiklm-git
_pkgname=msiklm
pkgver=20180823.a284db0
pkgrel=1
pkgdesc='A simple backlighting manager for MSI steelseries keyboards'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('hidapi')
makedepends=('git')

url="https://github.com/Gibtnix/MSIKLM"
source=('msiklm-git::git://github.com/Gibtnix/MSIKLM')
md5sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd "${srcdir}/${pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    mkdir -p ${pkgdir}/usr/bin
    make INSTALLPREFIX=${pkgdir}/usr/bin install
}
