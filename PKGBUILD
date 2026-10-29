# Maintainer: wsmajt <kacpermusz@gmail.com>
pkgname=opentracker-cli
pkgver=1.5.1
pkgrel=1
_version=1.5.1
pkgdesc="CLI for tracking AI provider usage limits"
arch=('x86_64' 'aarch64')
url="https://github.com/wsmajt/opentracker"
license=('MIT')
makedepends=('go')
provides=('opentracker')
conflicts=('opentracker')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_version.tar.gz")
sha256sums=('bf4270f2b9e5829ddcbcbcec543d600fc42b023920cefdfda1a079e02d3ef547')

build() {
    cd "opentracker-$_version"
    make build VERSION=1.5.1
}

package() {
    cd "opentracker-$_version"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
