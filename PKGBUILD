# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Istvan Szekeres <szekeres@iii.hu>
pkgname=corral
pkgver=0.8.2
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
sha256sums=('26dad1803e8d06b659e82868957ceeebc85cb359b793da0e1ad8c02e86644b21')

build() {
    cd "$srcdir/corral-$pkgver"
    make prefix=/usr
}

package() {
    cd "$srcdir/corral-$pkgver"
    make DESTDIR="$pkgdir" prefix="/usr" install
    install -D LICENSE "$pkgdir/usr/share/licenses/corral/LICENSE"
}
