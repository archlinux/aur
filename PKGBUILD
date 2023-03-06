# Maintainer: tuberry

_srcname=chinadns-ng
pkgname=${_srcname}-git
pkgver=r380.0f80a32
pkgrel=1
pkgdesc='Chinadns next generation, refactoring with epoll and ipset'
arch=(i686 x86_64)
url=https://github.com/zfl9/${_srcname}
license=(AGPL3)
makedepends=(git)
provides=(${_srcname})
conflicts=(${_srcname})
source=(git+${url})
sha512sums=(SKIP)

pkgver() {
    cd ${_srcname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_srcname}
    make
}

package() {
    cd ${_srcname}
    make DESTDIR=${pkgdir}/usr/bin install
}
