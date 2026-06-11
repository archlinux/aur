# Maintainer: yancat <yancat_aur@icloud.com>
pkgname=zstbund
pkgver=1.0.3
pkgrel=4
pkgdesc='Bundle Arch Linux packages with all dependencies and GPG keys into a zip file for offline installation.'
arch=('x86_64')
url="https://github.com/yan-cat/zstbund"
license=('GPL3')
depends=('pacman' 'zip')
makedepends=('rust' 'cargo')
source=("zstbund-${pkgver}.tar.gz")
sha256sums=('70a598d4a3c5344ca71ee9e2aec68a2bff00afb00d9848e8907147cf77583f4a')
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
