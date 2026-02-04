pkgname=kumono-bin
pkgver=0.67.1
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('25f3573714a57230203db6c2de6f0967ba029145d71fb1d99bccab270f37bc95')
sha256sums_x86_64=('6da1c776de5c1681a6724b4fb9e83f9a9c2733cbf7191edf1699fa78f5eeea28')
sha256sums_aarch64=('55e9395ae43c5064318f8207469b65e2b1a6223411d2d4d0e04b3261f72191a3')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
