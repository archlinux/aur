# Maintainer: Genki Sky <alt+archlinux.org@genki.is>

pkgname=human-git
pkgver=1
pkgrel=1
pkgdesc='Output a number in human-readable format'
arch=('i686' 'x86_64')
url='http://git.z3bra.org/human/log.html'
license=('WTFPL')
makedepends=('git')
provides=('human')
conflicts=('human')
source=('git://z3bra.org/human')
md5sums=('SKIP')

pkgver() {
    cd human
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd human
    make
}

package() {
    cd human
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/human/LICENSE
}
