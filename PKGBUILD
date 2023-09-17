# Maintainer: cat6241 <shakalnykot@proton.me>
pkgver=2.2.0
pkgrel=1

pkgname=asciicaesar
pkgdesc="Caesar cipher encryption utility"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/sourimteam/asciicaesar"
license=('MIT')
source=("${pkgname}-${pkgver}::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a9b5fd1328b54e616627f95fec7e1604a868fee52411279336ce3d8dad6d5698')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp asciicaesar "$pkgdir/usr/bin/asciicaesar"
}
