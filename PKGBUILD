# Maintainer: wsmajt <kacpermusz@gmail.com>
pkgname=opentracker-cli
pkgver=1.5.0
pkgrel=1
_version=1.5.0
pkgdesc="CLI for tracking AI provider usage limits"
arch=('x86_64' 'aarch64')
url="https://github.com/wsmajt/opentracker"
license=('MIT')
makedepends=('go')
provides=('opentracker')
conflicts=('opentracker')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_version.tar.gz")
sha256sums=('f3db9e19af3a44b84cb08e0b206dc376c50537b3b1ea32a7424ae52c518f9df1')

build() {
    cd "opentracker-$_version"
    make build VERSION=1.5.0
}

package() {
    cd "opentracker-$_version"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
