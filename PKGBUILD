# Maintainer: Aarik Pokras <me@aarikpokras.com>
pkgname=ebsl
pkgver=2.8.0
pkgrel=1
pkgdesc="A shell-accessible configuration file format."
arch=('any')
url="https://github.com/aarikpokras/ebsl"
license=('MIT')
depends=('base-devel' 'cmake' 'gzip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aarikpokras/ebsl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3d439456914bcf045b8d79d4adae9bce698853bebd5831f6408dadc265bb2b33')
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
