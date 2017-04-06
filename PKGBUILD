# Maintainer: Genki Sky <arch at genki dot is>

pkgname=human-git
pkgver=20160501.50c80e6
pkgrel=1
pkgdesc='Output a number in human-readable format'
arch=('any')
url='http://git.z3bra.org/human/log.html'
license=('WTFPL')
makedepends=('git')
provides=('human')
conflicts=('human')
source=('git://z3bra.org/human')
md5sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd ${pkgname%-git}
    make
}

package() {
    cd ${pkgname%-git}
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
