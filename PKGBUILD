pkgname=kumono-bin
pkgver=0.73.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('071711d7cffbfa1048d2576ea9a8fec14779acdadee040dcb705ec4bf0a5cc8c')
sha256sums_x86_64=('f0e35af2be1f5c01954a9dbd792812f88cc1a1bf1e9b36836e5af88cb96d5362')
sha256sums_aarch64=('f19b67ead8bfab42291ba5b58e6c513d382d4493bba5429d773a29337fc2af9e')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
