# Maintainer: yancat <yancat_aur@icloud.com>
pkgname=zstbund
pkgver=1.0.1
pkgrel=3
pkgdesc='打包pacman软件包及其依赖以供离线使用'
arch=('x86_64')
url="https://github.com/yan-cat/zstbund"
license=('GPL3')
depends=('pacman' 'zip')
makedepends=('rust' 'cargo')
source=("zstbund-${pkgver}.tar.gz")
sha256sums=('a5a7c2ac281cb74ca03aac6d1648c0847d38e15d0c146936a89196e59d4d379e')
options=('!debug')

build() {
  cd "$srcdir/zstbund"
  cargo build --release --locked
}

package() {
  cd "$srcdir/zstbund"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
