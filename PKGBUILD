# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=srhtctl
pkgver=0.1.1
pkgrel=1
pkgdesc='CLI for interacting with the sr.ht API'
arch=('x86_64')
url='https://git.xenrox.net/~xenrox/srhtctl'
license=('GPL3')
makedepends=('git' 'go')
provides=('srhtctl')
source=("$pkgname-$pkgver.tar.gz::https://git.xenrox.net/~xenrox/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8468538669960864e5cb46310c86e737358184a3dd6a65c906b595e8521abcca')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
