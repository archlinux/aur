# Maintainer: Pulsar <Pulsar33550336@163.com>

pkgname=tuack-ng-bin
pkgver=0.1.1
pkgrel=2
pkgdesc="重构后的 tuack 项目，旨在提供更加高效和轻量的出题体验。"
url="https://github.com/tuack-ng/tuack-ng"
license=("AGPL-3.0-or-later")
arch=("x86_64")
provides=("tuack-ng")
conflicts=("tuack-ng")
depends=("gcc-libs" "glibc")
source=("https://github.com/tuack-ng/tuack-ng/releases/download/$pkgver/tuack-ng-$pkgver-x86_64.tar.gz")
sha256sums=('208b253aa66d8b6ebc24ee6325f7a9ab7d7df73d67a9323185645e60eee52cc9')

package() {
    install -Dm755 tuack-ng -t "$pkgdir/usr/bin"
    
    install -dm755 "$pkgdir/usr/share/tuack-ng/templates/"
    find templates -type d -exec install -dm755 "$pkgdir/usr/share/tuack-ng/{}" \;
    find templates -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/tuack-ng/{}" \;
    
    install -dm755 "$pkgdir/usr/share/tuack-ng/scaffold/"
    find scaffold -type d -exec install -dm755 "$pkgdir/usr/share/tuack-ng/{}" \;
    find scaffold -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/tuack-ng/{}" \;
}

