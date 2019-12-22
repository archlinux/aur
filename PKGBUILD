# Maintainer: Istvan Szekeres <szekeres@iii.hu>
pkgname=corral
pkgver=0.3.0
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
sha256sums=('5e2f825dd67a060623bdbd992bcdf2d4a377a6d491f4bd60e8754f60df33e578')

build() {
    cd "$srcdir/corral-$pkgver"
    make prefix=/usr
}

package() {
    cd "$srcdir/corral-$pkgver"
    make DESTDIR="$pkgdir" prefix="/usr" install
    install -D LICENSE "$pkgdir/usr/share/licenses/corral/LICENSE"
}
