# Maintainer: MatMoul <matmoul@gmail.com>
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=alpm_octopi_utils
pkgver=1.0.1
_commit=19276e6269509d94bdb7a216da1b347c8dea6d73
pkgrel=1
pkgdesc="Alpm utils for Octopi"
url="https://octopiproject.wordpress.com/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pacman')
makedepends=('vala')
source=("https://github.com/aarnt/${pkgname}/archive/${_commit}.zip")
sha256sums=('0af157f39a35551c6cb4172686ed19f0565b9111978c5f68c285efd0fcd73434')
         
build() {
    cd "$pkgname-$_commit"
    make
}

package() {
    cd "$pkgname-$_commit"
    install -D -m755 src/libalpm_octopi_utils.so "$pkgdir"/usr/lib/libalpm_octopi_utils.so
    install -D -m644 src/libalpm_octopi_utils.pc "$pkgdir"/usr/lib/pkgconfig/libalpm_octopi_utils.pc
    install -D -m644 src/alpm_octopi_utils.h "$pkgdir"/usr/include/alpm_octopi_utils.h
}
 
