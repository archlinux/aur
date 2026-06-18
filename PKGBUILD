# Maintainer: Alessandro Chitarrini <alessandro.chitarrini51@gmail.com>
pkgname=swtch
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimal terminal stopwatch"
arch=('x86_64' 'aarch64')
url="https://github.com/chitvs/swtch"
license=('MIT')
depends=('glibc')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('028c367cc51f91f5a684e0f4af5a670376ec880bcc9adcfe37b51444c17d03fd')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
