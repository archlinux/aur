# Maintainer: Jeppe Toustrup <archlinux@tenzer.dk>
pkgname=rdd-git
pkgver=r28.3b1d553
pkgrel=1
pkgdesc='Redis database dumper'
arch=('any')
url='https://github.com/r043v/rdd'
license=('CCPL')
depends=('hiredis')
makedepends=('git')
provides=('rdd')
conflicts=('rdd')
source=("${pkgname}::git://github.com/r043v/rdd.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    install -D "${srcdir}/${pkgname}/rdd" "${pkgdir}/usr/bin/rdd"
}
