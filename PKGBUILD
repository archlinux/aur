pkgname=kumono-bin
pkgver=0.61.3
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('74f822dfd0131f7527c2cc1214ddca3a32b009f22d6e9b3385c9689a8d340e66')
sha256sums_x86_64=('7c471ed24aa864e96f0874cb1affba68f616bf6abeec1977f34b9bffac32b4d7')
sha256sums_aarch64=('52d0e0243ed9218f9ba77aafe553fe804cc38c3eacec4d2bab676f4eab8b70db')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
