# Maintainer: Aarik Pokras <me@aarikpokras.com>
pkgname=ebsl
pkgver=2.6.0
pkgrel=4
pkgdesc="A shell-accessible configuration file format."
arch=('any')
url="https://github.com/aarikpokras/ebsl"
license=('MIT')
depends=('base-devel' 'cmake' 'gzip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aarikpokras/ebsl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4377e85dd874d9d2c2951d17e161f6258dba90f0d40510c2f0b8b3c84910651')
package() {
        cd "$pkgname-$pkgver"
        cmake -Bbuild
        cd build
        make
        install -Dm755 ebsl "$pkgdir/usr/bin/ebsl"
        cd ..
        gzip man1/ebsl.1
        install -Dm644 man1/ebsl.1.gz "$pkgdir/usr/share/man/man1/ebsl.1.gz"
}
