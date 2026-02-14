pkgname=kumono-bin
pkgver=0.70.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('b7761549c2344f214165b7680bb7d21ec20157bda7e035eb13382ec45f2d479f')
sha256sums_x86_64=('e442dd14e22713685dc48bdd458be4a6e3b645ecbfe8d51d9d7d94e8ee95e0c1')
sha256sums_aarch64=('91370b9b9d1626f26f479cedb86058254b32aa91c7333dccf29a1fa988ec3ef9')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
