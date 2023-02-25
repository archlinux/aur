# Maintainer: tuberry

_srcname=chinadns-ng
pkgname=${_srcname}-git
pkgver=r366.8f61b8c
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
    git checkout b25 -q # tag
    make
}

package() {
    cd ${_srcname}
    make DESTDIR=${pkgdir}/usr/bin install
}
