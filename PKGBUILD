# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=unpaywall
pkgname=chromium-${gitname}-git
pkgver=264.ea5587a
pkgrel=1
pkgdesc="Chromium extension to find free journal articles"
arch=('any')
url="https://github.com/ourresearch/${gitname}"
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
    cp -dr --no-preserve=ownership "${srcdir}/${gitname}"/extension/* "${pkgdir}/usr/share/${pkgname}/"
}
