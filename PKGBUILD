# Maintainer: cat6241 <shakalnykot@proton.me>
pkgver=2.2.1
pkgrel=1

pkgname=asciicaesar
pkgdesc="Caesar cipher encryption utility"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/sourimteam/asciicaesar"
license=('MIT')
source=("${pkgname}-${pkgver}::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c53591e5cf985c9f5deb54472bde7f908102da41a51c65f37de70963e3fd8cb5')

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
