pkgname=kumono-bin
pkgver=0.68.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('f6845e4e6e84d05d5c073982b06beefae38611cd1f222d4f94d2d8052e13ea72')
sha256sums_x86_64=('f91511aab6190288d75fdb9de381fe0259a7e37dd4c1a3a4e122a0e6ec828235')
sha256sums_aarch64=('8d25bf1718511310881d85b015c249bd57391700c07c3105c249d778feba7919')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
