pkgname=kumono-bin
pkgver=0.63.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('0af66f8c90946d619809b1171028983c92ca98bb6841fe53ff507c50be269e29')
sha256sums_x86_64=('7ff25cfeb11ad85dbb51bc9a88e712054ebb4b1961218459cf598e796928ea7f')
sha256sums_aarch64=('67c9727e4ddcf2eab4a7ad61cca4ef6ac8ae0ebd1408ff88870d91833fffb15f')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
