# Maintainer: Yardena Cohen <yardenack at gmail dot com>

# check for new commits:
#   https://github.com/stylish-userstyles/stylish-chrome/commits/master

gitname=stylus
pkgname=${gitname}-git
pkgver=1.5.29.2.g891d185f
pkgrel=1
epoch=1
pkgdesc="User styles manager extension for Chrome and Chrome-like things"
arch=('any')
url="https://github.com/openstyles/${gitname}"
license=('GPL3')
makedepends=(git)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git describe --tags | sed 's|-|\.|g')"
    ver=${ver//-/.}
    printf "%s" "${ver#v}"
}
package() {
    mkdir -p "${pkgdir}/usr/share/chromium/${gitname}"
    shopt -u dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${gitname}"/* "${pkgdir}/usr/share/chromium/${gitname}/"
}
