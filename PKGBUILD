# Maintainer: Aarik Pokras <me@aarikpokras.com>
pkgname=ebsl
pkgver=2.7.0
pkgrel=2
pkgdesc="A shell-accessible configuration file format."
arch=('any')
url="https://github.com/aarikpokras/ebsl"
license=('MIT')
depends=('base-devel' 'cmake' 'gzip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aarikpokras/ebsl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d40cde6d2fa6a7d51b2bc5e87b7876d165554eb762bd5bf1c767ae7434eec0bc')
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
