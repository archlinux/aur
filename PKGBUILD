# Maintainer: Yardena Cohen <yardenack at gmail dot com>

# check for new commits:
#   https://github.com/iamadamdev/bypass-paywalls-chrome/commits/master

gitname=bypass-paywalls-chrome
pkgname=chromium-bypass-paywalls-git
pkgver=450.8301a3b
pkgrel=1
pkgdesc="Chromium extension to bypass paywalls"
arch=('any')
url="https://github.com/iamadamdev/${gitname}"
license=('unknown')
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
    cp -dr --no-preserve=ownership "${srcdir}/${gitname}"/* "${pkgdir}/usr/share/${pkgname}/"
}
