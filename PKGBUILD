pkgname=kumono-bin
pkgver=0.68.2
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('77c8511d9c1e8b5090a677ba0ee86073a63c415e71c32c7665ce50ed0f31ed4c')
sha256sums_x86_64=('acc2f80eff256221e6089c1629029b42e6ef2507e14ca32773989c5cc9da5804')
sha256sums_aarch64=('60e937f1713cda0522586ec5aaee7f6173d9a238f7060eff9efa9bd0a82c23c2')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
