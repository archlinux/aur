# Maintainer: yancat <yancat_aur@icloud.com>
pkgname=zstbund
pkgver=1.0.0
pkgrel=1
pkgdesc='打包pacman软件包及其依赖以供离线使用'
arch=('x86_64')
url="https://github.com/yan-cat"
license=('GPL3')
depends=('pacman' 'zip')
makedepends=('rust' 'cargo')
source=('zstbund-1.0.0.tar.gz')
sha256sums=('97ec6a78812248ff86ba1b6f3c2f3c9acedb7da543d9ef9f910e5c222f9def1f')

build() {
  cd "$srcdir/zstbund"
  cargo build --release --locked
}

package() {
  cd "$srcdir/zstbund"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
