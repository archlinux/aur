# Maintainer : Drew DeVault <sir@cmpwn.com>
pkgname=samurai
pkgver=0.6
pkgrel=1
pkgdesc='ninja-compatible build tool written in C'
arch=("x86_64")
url='https://github.com/michaelforney/samurai'
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/michaelforney/samurai/archive/$pkgver.tar.gz")
sha256sums=('b1ead55ec7b319e08e1c66924c55c2af467f32a250cb86827b7a4496b6a8822f')

build() {
    cd "$pkgname-$pkgver"
    make samu
}

package() {
    cd "$pkgname-$pkgver"
    make install PREFIX=/usr DESTDIR="$pkgdir"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
} 
