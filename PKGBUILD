# Maintainer icasdri <icasdri at gmail dot com>

_pkgname=mpris2controller
pkgname=mpris2controller-git
pkgver=0.9.r0.g5a85e0a
pkgrel=1
pkgdesc="A small daemon that intelligently controls MPRIS2 compatible players"
arch=(any)
url="https://github.com/icasdri/mpris2controller"
license=('GPL3')
depends=('python-dbus' 'python-gobject')
makedepends=('git')
source=("git+https://github.com/icasdri/mpris2controller.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
