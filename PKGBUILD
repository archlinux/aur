# Maintainer: wsmajt <kacpermusz@gmail.com>
pkgname=opentracker-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for tracking AI provider usage limits"
arch=('x86_64' 'aarch64')
url="https://github.com/wsmajt/opentracker"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    make build VERSION=$pkgver
}

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
