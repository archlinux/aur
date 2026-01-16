pkgname=kumono-bin
pkgver=0.61.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('30eb708b40c1b5eb4623f30b87bd1f5fca8394e9692e07d170689ec048b28072')
sha256sums_x86_64=('75d61b36959e02bafaaa649d4b4c2293742ed22bc614900b5f59158a816ecc93')
sha256sums_aarch64=('c96254858072c8cbdcbfa9c5dd8a46e41e51ee4bd54cfa0d441df5503a811c5d')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
