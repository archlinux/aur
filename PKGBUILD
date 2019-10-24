# Maintainer: MatMoul <matmoul@gmail.com>
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=alpm_octopi_utils
pkgver=1.0.2
_commit=bd9fcd5fc5de8e8e800fbdf553249c95f1300356
pkgrel=1
pkgdesc="Alpm utils for Octopi"
url="https://octopiproject.wordpress.com/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pacman-contrib')
makedepends=('vala')
source=("https://github.com/aarnt/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('6af796743349f04127b4e168b03afef510d1b869c8116718c4cc26059ef6d19b')
         
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
 
