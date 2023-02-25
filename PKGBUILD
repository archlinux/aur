# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=zenith
pkgver=0.14.0
pkgrel=1
pkgdesc="Terminal system monitor with histograms, written in Rust"
arch=('x86_64')
url="https://github.com/bvaisvil/zenith"
license=('MIT')
makedepends=('cargo' 'llvm' 'clang')
optdepends=('nvidia-utils')
provides=('zenith')
conflicts=('zenith-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2cbcea2625cfa97c161b974ad412a47e330f7fd31bec0479e329ed3606cfc569')

build() {
    cd "$pkgname-$pkgver"

    make
}

package() {
    cd "$pkgname-$pkgver"

    make PREFIX=$pkgdir/usr install
}
