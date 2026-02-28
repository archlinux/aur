pkgname=kumono-bin
pkgver=0.75.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('4e620604917d540d82e34f2167b4491c660ffce7823528d119e45062927d5be7')
sha256sums_x86_64=('d1119e322abfcd85aeebcb73bdb0d93a112d1070af48d6c755efcd7669b199dc')
sha256sums_aarch64=('17d89568b243e2a02afdaf90987711f688d32aeb9e016e5bb6d0cb318ed12c2a')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
