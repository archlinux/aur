# Maintainer: tuberry

_srcname=dns2tcp
pkgname=${_srcname}-git
pkgver=r94.10ed687
pkgrel=1
pkgdesc='Utility to convert dns query from udp to tcp'
arch=(i686 x86_64)
url=https://github.com/zfl9/${_srcname}
license=(AGPL3)
conflicts=(${_srcname})
provides=(${_srcname})
depends=(glibc)
source=(git+${url})
sha512sums=(SKIP)

pkgver() {
    cd ${_srcname}
    printf "r%s.%s" $( git rev-list --count HEAD ) $( git rev-parse --short HEAD )
}

build() {
    cd ${_srcname}
    make
}

package() {
    cd ${_srcname}
    make DESTDIR=${pkgdir}/usr/bin install
}

