# Maintainer: Jan Fidra <tkmxqrd@gmail.com>
pkgname=eclipselock
pkgver=1.0.0
pkgrel=1
pkgdesc="A command-line tool for file encryption using AES-256-CBC"
arch=('x86_64')
url="https://github.com/tkmxqrdxddd/EclipseLock"
license=('MIT')
depends=('openssl')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tkmxqrdxddd/EclipseLock/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "EclipseLock-$pkgver"
    make
}

package() {
    cd "EclipseLock-$pkgver"
    install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
