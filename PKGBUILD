# Maintainer: tioguda  <guda.flavio@gmail.com>

pkgbase=bigbashview-framework
pkgname=${pkgbase}
_pkgname=bbv-framework
pkgver=r53.34d776b
pkgrel=2
arch=('any')
license=('MIT')
url="https://github.com/biglinux/${_pkgname}"
pkgdesc="Framework for BigBashView"
makedepends=('git')
source=("git+https://github.com/biglinux/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    depends=('geticons')
    provides=("${_pkgname}=${pkgver}")
    conflicts=("${_pkgname}")

    mkdir -p "${pkgdir}/usr/share/"
    cp -r "${srcdir}/${_pkgname}"/usr/* "${pkgdir}/usr/"
}
