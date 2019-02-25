# Maintainer : Drew DeVault <sir@cmpwn.com>
pkgname=samurai
pkgver=0.5
pkgrel=1
pkgdesc='ninja-compatible build tool written in C'
arch=("x86_64")
url='https://github.com/michaelforney/samurai'
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/michaelforney/samurai/archive/$pkgver.tar.gz")
sha256sums=('a00ef21662719c5e4a18481c8e1b572309ddf47e7087bd5db5664f47352cbb40')

build() {
    cd "$pkgname-$pkgver"
    make samu
}

package() {
    cd "$pkgname-$pkgver"
    make install PREFIX=/usr DESTDIR="$pkgdir"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
} 
