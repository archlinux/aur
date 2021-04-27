# Maintainer: eugene hwang <hwang dot eug at gmail dot com>

pkgname=rofi-gister-git
_pkgname=rofi-gister
pkgver=r6.77229b1
pkgrel=1
pkgdesc="Rofi user script for accessing gists synced by gister"
arch=('x86_64')
url="https://github.com/hwangeug/rofi-gister"
license=('MIT')
depends=('gister-git')
makedepends=('git')
provides=('rofi-gister')
conflicts=('rofi-gister')
source=("$_pkgname::git://github.com/hwangeug/rofi-gister.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
}
