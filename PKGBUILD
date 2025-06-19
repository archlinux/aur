# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Istvan Szekeres <szekeres@iii.hu>
pkgname=corral
pkgver=0.9.0
pkgrel=1
epoch=
pkgdesc="Pony dependency manager tool"
arch=('x86_64')
url="https://github.com/ponylang/corral"
license=('BSD-2-Clause')
depends=()
makedepends=('ponyc' 'git')
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/ponylang/corral/archive/$pkgver.tar.gz")
sha256sums=('7da78ceb96338b746e3c28ad16454d86fd30da576fa66e8489d781311fd1983b')

build() {
    cd "$srcdir/corral-$pkgver"
    make prefix=/usr
}

package() {
    cd "$srcdir/corral-$pkgver"
    make DESTDIR="$pkgdir" prefix="/usr" install
    install -D LICENSE "$pkgdir/usr/share/licenses/corral/LICENSE"
}
