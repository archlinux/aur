pkgname=kumono-bin
pkgver=0.59.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('e0e78bf26515b866ed3057e0d5cfeae6d95cad790e3d0fe4b6aefe6b3f9e1625')
sha256sums_x86_64=('648cfe531c25f5474d5b9eaff2a76607bf9f75408e905c62dad953bfb1b686bb')
sha256sums_aarch64=('a9fea70998694b0830adff61902ccfc5ce12b8b38dec59444bcaf18871099838')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
