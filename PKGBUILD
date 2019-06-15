# Maintainer: Kristian <morguldir@protonmail.com>
# Contributor: Yardena Cohen <yardenack at gmail dot com>

pkgname=ubo-extra-git
_pkgname=ubo-extra
provides=(ubo-extra)
pkgver=2.81
pkgrel=1
pkgdesc="A companion extension to uBlock Origin for chromium-based browsers."
arch=('any')
license=('GPL3')
makedepends=(git)
url="https://github.com/gorhill/uBO-Extra.git"
source=("$_pkgname::git+https://github.com/gorhill/uBO-Extra.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    local ver="$(git describe --tags | sed 's|-|\.|g')"
    printf "%s" "${ver//-/.}"
}

package() {
    mkdir -p "${pkgdir}/usr/share/${_pkgname}"
    install -m644 -D ${srcdir}/${_pkgname}/* "${pkgdir}/usr/share/${_pkgname}"
}
