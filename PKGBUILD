# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=darkreader
pkgname=chromium-${gitname}-git
pkgver=2106.6dd1e539
pkgrel=1
pkgdesc="Chromium extension to inverts brightness of web pages"
arch=('any')
url="https://github.com/${gitname}/${gitname}"
license=('MIT')
makedepends=(git)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}
package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    shopt -u dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${gitname}"/src/* "${pkgdir}/usr/share/${pkgname}/"
}
