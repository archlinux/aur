pkgname=kumono-bin
pkgver=0.64.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('c28f50284626782864fef2a112a8f4b66c18cdc3fa1d75b54f12ded0be014b3b')
sha256sums_x86_64=('61d7f67be7cfdf8184125c9ee78f18a1b734b35a9361e75dc8957e6c70d62ad9')
sha256sums_aarch64=('f0b2f5940c79d2be30e07950e887222dde64270553cf8ad831d119a2d0d5f4d8')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
