pkgname=kumono-bin
pkgver=0.72.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('55b271fbdc15bf8c884cb5c855918aa0aef6fc0d6bb120cffcbdb27ebb15f637')
sha256sums_x86_64=('7128214feeb5c8f5582745e702b2fd67be72bb40b337dcd10ec085396b7deafd')
sha256sums_aarch64=('b28f8d1bb2ee0fdac8898ca929da255eb49856f5b28c7ffa4e3c96d8cfa9be5e')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
