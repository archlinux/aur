# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Istvan Szekeres <szekeres@iii.hu>
pkgname=corral
pkgver=0.9.2
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
sha256sums=('c6b0000fe2f5c451923988e2fc44da3f2a3c37dd35f2125239028edebdb408b5')

build() {
    cd "$srcdir/corral-$pkgver"
    make prefix=/usr
}

package() {
    cd "$srcdir/corral-$pkgver"
    make DESTDIR="$pkgdir" prefix="/usr" install
    install -D LICENSE "$pkgdir/usr/share/licenses/corral/LICENSE"
}
