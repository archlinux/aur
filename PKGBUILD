# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Sergio Tortosa <sertorbe@gmail.com>
pkgname=bake
pkgver=0.1.49
pkgrel=1
pkgdesc="An easy to use build system. Designed to be make/autotools for the 21st century."
arch=('i686' 'x86_64')
url="https://launchpad.net/bake"
license=("GPL3")
makedepends=('itstool' 'vala')
source=("https://launchpad.net/bake/0.1/${pkgver}/+download/bake-${pkgver}.tar.gz")
md5sums=('20eda033c1482900da0cccfb90a77f6d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
    ./bake-bootstrap --configure install-directory="$pkgdir/"
}

package() {
    cd "$srcdir/$pkgname-$pkgver" 
    ./bake-bootstrap install
}
