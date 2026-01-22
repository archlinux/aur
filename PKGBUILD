pkgname=kumono-bin
pkgver=0.64.1
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('a312663055b50f4a70d93ecd898ee2245a6b62a16ae9cfa855506c994812ea52')
sha256sums_x86_64=('158f1d03e3bdbd0b915ca9df48365797f78879bbd2e85c3c85a7235d9046a04c')
sha256sums_aarch64=('6b7cd80eae4220e8af982c14a33350d3a9acce6e4728a400511b26941241815a')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
