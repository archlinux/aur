# Maintainer: eugene hwang <hwang dot eug at gmail dot com>

pkgname=xpointerbarrier-git
_pkgname=xpointerbarrier
pkgver=r19.f4b2be1
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/hwangeug/rofi-gister"
license=('MIT')
depends=('libx11' 'libxfixes' 'libxrandr')
provides=('xpointerbarrier')
conflicts=('xpointerbarrier')
options=('!buildflags')
source=("git+https://www.uninformativ.de/git/xpointerbarrier.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
