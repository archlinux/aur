pkgname=kumono-bin
pkgver=0.65.2
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('6dd0c9b38896d3cc296cdb8fc42666f10f3ccf71f67b9fe200034f7607a8c578')
sha256sums_x86_64=('27a8552b34b90ff300ab3f0e3b775afaa3f110d4e17ea82407fc85813ec95ae8')
sha256sums_aarch64=('0813545ca01effae494c6aa8d4b9b97bfeb55afb6159f7c252bce445f9270078')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
