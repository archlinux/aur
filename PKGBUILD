# Maintainer: QaidVoid <contact@qaidvoid.dev>
pkgname=soar-nightly-bin
pkgver=d5787a7
pkgrel=0
pkgdesc="A fast, modern package manager for Static Binaries, Portable Formats (AppImage|AppBundle|FlatImage|Runimage) & More [Nightly Release]"
arch=('aarch64' 'x86_64')
url="https://soar.qaidvoid.dev"
license=('MIT')
provides=('soar')
conflicts=('soar' 'soar-bin')
options=(!strip)
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/pkgforge/soar/releases/download/nightly/soar-aarch64-linux.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/pkgforge/soar/releases/download/nightly/soar-x86_64-linux.tar.gz")
sha256sums_aarch64=('e2920b750abd99c67d9b56e86fb85da49a9be49ded07f627861a58d7e252cc90')
sha256sums_x86_64=('b31edf5a1ef0d8a8e8d6200ca92ce9d73a418789887b47514dd9960e74df4916')

package() {
    install -Dm755 "$srcdir/release/soar" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/release/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$srcdir/release/"{README.md,CHANGELOG.md} -t "$pkgdir/usr/share/doc/$pkgname"
}
