pkgname=kumono-bin
pkgver=0.65.7
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('31a1f54ceee3f9ba57f4022147ea5f0266bae2bd385fe5cbc19670081075dd3c')
sha256sums_x86_64=('3cdaccefd8a4134b3dddf5939355274533284efa26ed9cee2cc3c7311c454df4')
sha256sums_aarch64=('e730909073d82d63f9bf2693c74c73c766498a46b6cb78c7765f4e1bbdbcc7ef')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
