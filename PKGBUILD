# Maintainer: alzeih <alzeih@users.noreply.github.com>
pkgname=cjose
pkgver=0.6.1
pkgrel=1
pkgdesc="C library implementing the Javascript Object Signing and Encryption (JOSE)"
arch=('x86_64')
url="https://github.com/cisco/cjose"
license=('MIT')
depends=('openssl' 'jansson')
makedepends=()
source=("https://github.com/cisco/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('7ae67a6d19591b3d19b888270ec0ca17df399bea117e42686fc1de39b3741ed9a8816f96d33d090687c49c3123cdc95430a781835a525a02d22561ebf5aaa653')

build() {
        cd "$pkgname-$pkgver"
        ./configure --prefix=/usr
        make
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
