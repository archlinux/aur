# Maintainer: Johannes Wellhöfer <johannes.wellhofer@gmail.com>
pkgname='recidivm'
pkgver=0.2
pkgrel=1
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='http://jwilk.net/software/recidivm'
pkgdesc=$'recidivm - estimate peak virtual memory use'
license=('MIT')
source=('https://github.com/jwilk/recidivm/releases/download/0.2/recidivm-0.2.tar.gz')
sha256sums=('56c9e5199561a469763aa402e183fc82fdbe08d97132ec4e42fc737d7c178da3')
makedepends=('gcc' 'make')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=$pkgdir/usr install
}
