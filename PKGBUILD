# Maintainer: tuberry

_srcname='chinadns-ng'
pkgname=chinadns-ng-git
pkgver=r341.90e9f26
pkgrel=1
pkgdesc='Chinadns next generation, refactoring with epoll and ipset'
arch=('i686' 'x86_64')
url="https://github.com/zfl9/${_srcname}"
license=('AGPL3')
depends=('glibc')
makedepends=('git')
provides=("${_srcname}")
conflicts=("${_srcname}")

source=("git+${url}")
sha512sums=('SKIP')

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
    install -Dm755 ${_srcname} ${pkgdir}/usr/bin/${_srcname}
}
