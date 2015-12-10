# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=pickups
pkgname=python-${gitname}-git
pkgver=36.b25967e
pkgrel=1
pkgdesc='IRC gateway for Google Hangouts'
arch=('any')
license=('MIT')
url="https://github.com/mtomwing/${gitname}"
depends=('python' 'hangups-git')
makedepends=('python-setuptools')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}


package() {
    mkdir -p "${pkgdir}//usr/lib/python3.5/site-packages"
    cp -a "${srcdir}/${gitname}/${gitname}" "${pkgdir}//usr/lib/python3.5/site-packages/${gitname}"
}
