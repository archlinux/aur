pkgname=kumono-bin
pkgver=0.73.1
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('285cf2509beb47e5f2d89724e6f2432615b4f3b0c8fc9ab4861da0381f2c5c18')
sha256sums_x86_64=('749762cdaab32e7ce8d2a913fd6e3d1f844d343d0a84944b8c9f8d8abe98f74f')
sha256sums_aarch64=('0e92ab96584f05ba6bd601e3a300a0702e0667d38d085d1ecab636dada4f8c54')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
