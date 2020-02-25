# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=srhtctl
pkgver=0.2.0
pkgrel=1
pkgdesc='CLI for interacting with the sr.ht API'
arch=('x86_64')
url='https://git.xenrox.net/~xenrox/srhtctl'
license=('GPL3')
makedepends=('git' 'go-pie')
provides=('srhtctl')
source=("$pkgname-$pkgver.tar.gz::https://git.xenrox.net/~xenrox/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('cf50c4033ee16089a49c882b5c439136c8271ea84a577377ea76b43a4b291e49')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
