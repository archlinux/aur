pkgname=kumono-bin
pkgver=0.65.6
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('6d74e79984e78b3b654eb5e577185f2429a7f4587e6826c3807f5f1a74d59656')
sha256sums_x86_64=('b0b66c80c40ee76036ae2b00fb8be716d4a60f0897c238354ca87dfc97b4cb38')
sha256sums_aarch64=('dbf99d81008133fa200cfe40c7a0fba3680affbea32158a1e2370f8cc05b9134')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
