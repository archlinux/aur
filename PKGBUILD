pkgname=kumono-bin
pkgver=0.69.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('0b94a80754823e7d3b2a150ae5f01ee01ed760f75f3e30fb0781166dde8c6dc4')
sha256sums_x86_64=('abfc9ee4822dc49719f60f8c52c0a4c0c8ec747d3a0edfb8f63c555e53e055f4')
sha256sums_aarch64=('28ce393ef02d74acae83746892e0bc8f934156d01302eb2f8702c41ec4e02eae')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
