pkgname=kumono-bin
pkgver=0.65.1
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('fa9e686b62b45ef3b617bb094da534d494265d7967c5fac18f66ef8650bd86ed')
sha256sums_x86_64=('54b3a7dc53c3a144f2eaed949ce3b674fab1c435de7b1f2d446d52c4acc592d1')
sha256sums_aarch64=('12b1b24a3b3dbd22a8b6aef05b4cf0fa669696675b874163b24f2a3c79431d92')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
